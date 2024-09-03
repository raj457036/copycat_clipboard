import Cocoa
import FlutterMacOS
import AppKit
import AVFoundation
import Security
import ScriptingBridge


@objc protocol ChromeTab {
  @objc optional var URL: String { get }
  @objc optional var title: String { get }
}

@objc protocol ChromeWindow {
  @objc optional var activeTab: ChromeTab { get }
  @objc optional var mode: String { get }
}

extension SBObject: ChromeWindow, ChromeTab {}

@objc protocol ChromeProtocol {
  @objc optional func windows() -> [ChromeWindow]
}

extension SBApplication: ChromeProtocol {}


public class FocusWindowPlugin: NSObject, FlutterPlugin {
    private var observer: AXObserver?
    private var eventListening = false
    public static var windowChangedCallback: WindowChanged = WindowChanged()
    public static var eventChannel: EventChannelHandler?



    public static func register(with registrar: FlutterPluginRegistrar) {
        let channel = FlutterMethodChannel(name: "focus_window", 
        binaryMessenger: registrar.messenger)
        eventChannel = EventChannelHandler(
            name: "focus_window_stream",
            messenger: registrar.messenger
        )
        let instance = FocusWindowPlugin()
        registrar.addMethodCallDelegate(instance, channel: channel)
    }
    
    public func getActiveWindowId() -> Int? {
        if let frontApp = NSWorkspace.shared.frontmostApplication {
            let windowNumber = frontApp.processIdentifier
            return Int(windowNumber)
        } else {
            return nil
        }
    }
    
    public func setActiveWindow(windowId: Int) {
        // Retrieve window from given windowId processIdentifier
        let app = NSRunningApplication(processIdentifier: pid_t(windowId))
        app?.activate(options: [.activateAllWindows, .activateIgnoringOtherApps])
    }

    public func pasteContent() {
        let virtualKey: CGKeyCode = CGKeyCode(0x09)
        var flags: CGEventFlags = CGEventFlags()
        flags.insert(CGEventFlags.maskCommand)
        let eventKeyDownPress = CGEvent(keyboardEventSource: nil, virtualKey: virtualKey, keyDown: true);
        eventKeyDownPress!.flags = flags
        eventKeyDownPress!.post(tap: .cghidEventTap);
        usleep(10000)
        let eventKeyUpPress = CGEvent(keyboardEventSource: nil, virtualKey: virtualKey, keyDown: false);
        eventKeyUpPress!.flags = flags
        eventKeyUpPress!.post(tap: .cghidEventTap);
    }

    public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        switch call.method {
            case "getActiveWindowId":
                if let windowId = self.getActiveWindowId() {
                    result(windowId)
                } else {
                    result(nil)
                }
            case "setActiveWindowId":
                guard let args = call.arguments as? [String: Any],
                      let windowId = args["windowId"] as? Int else {
                    result(
                        FlutterError(
                            code: "INVALID_ARGUMENT",
                            message: "Invalid argument: windowId",
                            details: nil
                        )
                    )
                    return
                }
                self.setActiveWindow(windowId: windowId)
                result(nil)
            case "pasteContent":
                self.pasteContent()
                result(nil)
            // IMPL
            case "isAccessibilityPermissionGranted":
                isAccessibilityPermissionGranted(call, result: result)
                break
            case "requestAccessibilityPermission":
                requestAccessibilityPermission(call, result: result)
                break
            case "openAccessibilityPermissionSetting":
                openAccessibilityPermissionSetting(call, result: result)
                break
            case "getIcon":
                getIcon(call, result: result)
                break
            case "getActivity":
                getActivity(call, result: result)
                break
            case "startObserver":
                startListening()
                break
            case "stopObserver":
                stopListening()
                break
            case "isObserving":
                isListening(call, result: result)
                break
            default:
                result(FlutterMethodNotImplemented)
        }
    }

    //    Utilities
    @discardableResult
    private func runAppleScript(source: String?) -> String? {
        if (source == nil || source == ""){
            return nil;
        }
        var error: NSDictionary?
        if let result = NSAppleScript(source: source!) {
            let output = result.executeAndReturnError(&error).stringValue
            return output
        }
        if (error != nil) {
            print(error!);
        }
        return nil
    }

    //    Private

    private func getIconForApplicationPath(_ applicationPath: String) -> NSImage? {
        let application = NSWorkspace.shared.icon(forFile: applicationPath)
        return application
    }
    
    private func getFrontApp() -> NSRunningApplication? {
        return NSWorkspace.shared.frontmostApplication;
    }
    
    private func getUrlForChromiumBasedBrowser(_ appId: String) -> String? {
        
        switch appId {
        case "com.google.Chrome", "com.google.Chrome.beta", "com.google.Chrome.dev", "com.google.Chrome.canary", "com.brave.Browser", "com.brave.Browser.beta", "com.brave.Browser.nightly", "com.microsoft.edgemac", "com.microsoft.edgemac.Beta", "com.microsoft.edgemac.Dev", "com.microsoft.edgemac.Canary", "com.mighty.app", "com.ghostbrowser.gb1", "com.bookry.wavebox", "com.pushplaylabs.sidekick", "com.vivaldi.Vivaldi":
            
            let chromeObject: ChromeProtocol = SBApplication.init(bundleIdentifier: appId)!
            
            let frontWindow = chromeObject.windows?()[0]
            let activeTab = frontWindow?.activeTab
            return activeTab?.URL
        default:
            return nil
        }
        
    }
    
    private func getActiveBrowserTabURLAppleScriptCommand(_ appId: String) -> String? {
        switch appId {
        case "com.google.Chrome", "com.google.Chrome.beta", "com.google.Chrome.dev", "com.google.Chrome.canary", "com.brave.Browser", "com.brave.Browser.beta", "com.brave.Browser.nightly", "com.microsoft.edgemac", "com.microsoft.edgemac.Beta", "com.microsoft.edgemac.Dev", "com.microsoft.edgemac.Canary", "com.mighty.app", "com.ghostbrowser.gb1", "com.bookry.wavebox", "com.pushplaylabs.sidekick", "com.operasoftware.Opera",  "com.operasoftware.OperaNext", "com.operasoftware.OperaDeveloper", "com.vivaldi.Vivaldi":
            return "tell app id \"\(appId)\" to get the URL of active tab of front window"
        case "com.apple.Safari", "com.apple.SafariTechnologyPreview":
            return "tell app id \"\(appId)\" to get URL of front document"
        default:
            return nil
        }
    }

    public func getActivity(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        
        let args:[String: Any?] = call.arguments as! [String: Any?];
        let withIcon: Bool = (args["withIcon"] ?? false) as! Bool ;
        
        var activity: [String: Any?] = [
            "pid": -1,
            "app": "",
            "appFileName": "",
            "appFilePath": "",
            "identifier": "",
            "title": "",
            "url": "",
            "document": "",
            "icon": nil,
        ]
        
        guard
            let application = getFrontApp(),
            let windows = CGWindowListCopyWindowInfo([.optionOnScreenOnly, .excludeDesktopElements], kCGNullWindowID) as? [[String: Any]]
        else {
            return
        }
        
        let frontmostAppPID = application.processIdentifier;
        
//        Getting the opened document
        var elements = [AXUIElement]()
        var windowList: AnyObject? = nil
        let appRef = AXUIElementCreateApplication(frontmostAppPID)
        if AXUIElementCopyAttributeValue(appRef, "AXWindows" as CFString, &windowList) == .success {
            elements = windowList as! [AXUIElement]
        }

        var docRef: AnyObject? = nil
        if !elements.isEmpty && AXUIElementCopyAttributeValue(elements.first!, "AXDocument" as CFString, &docRef) == .success {
            let filePath = docRef as! String
            activity["document"] = filePath
        }
        
//        Getting the url
        var url: String?
        
        if (application.bundleIdentifier != nil) {
            url = getUrlForChromiumBasedBrowser(application.bundleIdentifier!)
            if (url == nil) {
                let script =  getActiveBrowserTabURLAppleScriptCommand(application.bundleIdentifier ?? "");
                url = runAppleScript(source: script ?? "");
            }
        }
        
        for window in windows  {
            let windowOwnerPID = window[kCGWindowOwnerPID as String] as! pid_t
            if windowOwnerPID != frontmostAppPID {
                continue
            }
            if (window[kCGWindowAlpha as String] as! Double) == 0 {
                continue
            }
            
            let windowTitle = window[kCGWindowName as String] as? String ?? ""
            activity["title"] = windowTitle
        }
        if (withIcon && application.icon != nil) {
            let icon = NSBitmapImageRep(data: application.icon!.tiffRepresentation(using: .lzw, factor: .greatestFiniteMagnitude)!)!.representation(using: .png, properties: [:]);
            activity["icon"] = icon;
        }
        
        activity["pid"] = application.processIdentifier;
        activity["app"] = application.localizedName;
        activity["appFileName"] = application.bundleURL?.lastPathComponent;
        activity["appFilePath"] = application.bundleURL?.path;
        activity["identifier"] = application.bundleIdentifier;
        activity["url"] = url;
        
        result(activity)
    }

    public func getIcon(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        let args:[String: Any] = call.arguments as! [String: Any]
        let applicationPath: String = args["applicationPath"] as! String
        let application = getIconForApplicationPath(applicationPath)
        if (application != nil) {
            let data = NSBitmapImageRep(data: application!.tiffRepresentation(using: .lzw, factor: .greatestFiniteMagnitude)!)!.representation(using: .png, properties: [:]);
            
            if (data != nil) {
                result(data)
            }
        }
    }

    public func isAccessibilityPermissionGranted(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        let isGranted: Bool = AXIsProcessTrusted()
        result(isGranted)
    }
    
    public func requestAccessibilityPermission(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        let options: NSDictionary = [kAXTrustedCheckOptionPrompt.takeUnretainedValue() as NSString: true]
        let accessGranted: Bool = AXIsProcessTrustedWithOptions(options)
        result(accessGranted)
    }
    
    public func openAccessibilityPermissionSetting(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        let opened = NSWorkspace.shared.open(
            URL(string: "x-apple.systempreferences:com.apple.preference.security?Privacy_Accessibility"
               )!
        )
        result(opened)
    }

    //    OBSERVERS
    
    public func isListening(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        result(eventListening)
    }
    
    public func startListening() {
        if (!eventListening)
        {
            NSWorkspace.shared.notificationCenter.addObserver(
                self, selector: #selector(focusedAppChanged),
                name: NSWorkspace.didActivateApplicationNotification,
                object: nil
            )
            eventListening = true
        }
    }
    
    public func stopListening() {
        if (eventListening) {
            NSWorkspace.shared.notificationCenter.removeObserver(NSWorkspace.didActivateApplicationNotification)
            eventListening = false
        }
    }

    
     @objc public func focusedAppChanged() {
        if observer != nil {
          CFRunLoopRemoveSource(
            RunLoop.current.getCFRunLoop(),
            AXObserverGetRunLoopSource(observer!),
            CFRunLoopMode.defaultMode)
        }

        let frontmost = NSWorkspace.shared.frontmostApplication!
        let pid = frontmost.processIdentifier
        let focusedApp = AXUIElementCreateApplication(pid)
        
        AXObserverCreate(
          pid,
          {
            (
              _ axObserver: AXObserver,
              axElement: AXUIElement,
              notification: CFString,
              userData: UnsafeMutableRawPointer?
            ) -> Void in
            
            if notification == kAXFocusedWindowChangedNotification as CFString {
                FocusWindowPlugin.windowChangedCallback.focusedWindowChanged(axObserver, window: axElement)
            } else {
                let event: Dictionary<String, String> = [
                    "type": "TabChanged",
                ]
                try? FocusWindowPlugin.eventChannel?.success(event: event)
            }
          }, &observer)

        let selfPtr = UnsafeMutableRawPointer(Unmanaged.passUnretained(self).toOpaque())
        AXObserverAddNotification(
          observer!, focusedApp, kAXFocusedWindowChangedNotification as CFString, selfPtr)

        CFRunLoopAddSource(
          RunLoop.current.getCFRunLoop(),
          AXObserverGetRunLoopSource(observer!),
          CFRunLoopMode.defaultMode)

        var focusedWindow: AnyObject?
        AXUIElementCopyAttributeValue(focusedApp, kAXFocusedWindowAttribute as CFString, &focusedWindow)

        if focusedWindow != nil {
            FocusWindowPlugin.windowChangedCallback.focusedWindowChanged(observer!, window: focusedWindow as! AXUIElement)
        }
      }
}
