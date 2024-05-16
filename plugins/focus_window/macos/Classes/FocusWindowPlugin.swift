import Cocoa
import FlutterMacOS

public class FocusWindowPlugin: NSObject, FlutterPlugin {
    public static func register(with registrar: FlutterPluginRegistrar) {
        let channel = FlutterMethodChannel(name: "focus_window", binaryMessenger: registrar.messenger)
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
        let source = CGEventSource(stateID: .hidSystemState)
        let kVK_Command: UInt16 = 0x37
        let kVK_ANSI_V: UInt16 = 0x09
            
        // Down events for Command and V keys
        let cmdDown = CGEvent(keyboardEventSource: source, virtualKey: CGKeyCode(kVK_Command), keyDown: true)
        let vDown = CGEvent(keyboardEventSource: source, virtualKey: CGKeyCode(kVK_ANSI_V), keyDown: true)
        
        // Up events for V and Command keys
        let vUp = CGEvent(keyboardEventSource: source, virtualKey: CGKeyCode(kVK_ANSI_V), keyDown: false)
        let cmdUp = CGEvent(keyboardEventSource: source, virtualKey: CGKeyCode(kVK_Command), keyDown: false)
        
        // Ensure the Command key is marked as being held down when the V key event is posted
        vDown?.flags = .maskCommand
        vUp?.flags = .maskCommand
        
        // Post the key down events
        cmdDown?.post(tap: .cghidEventTap)
        usleep(1000) // 1 milliseconds delay
        vDown?.post(tap: .cghidEventTap)
        usleep(1000) // 1 milliseconds delay
        
        // Post the key up events
        vUp?.post(tap: .cghidEventTap)
        usleep(1000) // 1 milliseconds delay
        cmdUp?.post(tap: .cghidEventTap)
    }

    public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        switch call.method {
            case "getPlatformVersion":
                result("macOS " + ProcessInfo.processInfo.operatingSystemVersionString)
                break;
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
            default:
                result(FlutterMethodNotImplemented)
        }
    }
}
