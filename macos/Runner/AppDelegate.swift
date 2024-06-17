import Cocoa
import FlutterMacOS
import app_links

@NSApplicationMain
class AppDelegate: FlutterAppDelegate {

  override func applicationShouldTerminateAfterLastWindowClosed(_ sender: NSApplication) -> Bool {
    return false
  }

  override func application(
    _ application: NSApplication,
    continue userActivity: NSUserActivity,
    restorationHandler: @escaping ([NSUserActivityRestoring]) -> Void) -> Bool {

    guard let url = AppLinks.shared.getUniversalLink(userActivity) else {
      return false
    }
    
    AppLinks.shared.handleLink(link: url.absoluteString)
    
    return false // Returning true will stop the propagation to other packages
  }

  override func applicationDidFinishLaunching(_ notification: Notification) {
    if !isSingleInstance() {
      NSApplication.shared.terminate(self)
    }
  }

  override func applicationShouldHandleReopen(_ sender: NSApplication, hasVisibleWindows flag: Bool) -> Bool {
    if !flag {
      for window in sender.windows {
        window.makeKeyAndOrderFront(self)
      }
    }
    return true
  }

  private func isSingleInstance() -> Bool {
    let runningApps = NSWorkspace.shared.runningApplications
    let currentApp = NSRunningApplication.current

    for app in runningApps {
      if app.bundleIdentifier == currentApp.bundleIdentifier && app.processIdentifier != currentApp.processIdentifier {
        app.activate(options: [.activateAllWindows, .activateIgnoringOtherApps])
        return false
      }
    }
    return true
  }
}
