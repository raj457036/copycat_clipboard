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
            default:
                result(FlutterMethodNotImplemented)
        }
    }
}
