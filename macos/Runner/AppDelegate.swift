import Cocoa
import FlutterMacOS
import app_links

@NSApplicationMain
class AppDelegate: FlutterAppDelegate {
  override func applicationShouldTerminateAfterLastWindowClosed(_ sender: NSApplication) -> Bool {
    // return true
    return false
  }

  public override func application(
    _ application: NSApplication,
    continue userActivity: NSUserActivity,
    restorationHandler: @escaping ([any NSUserActivityRestoring]) -> Void) -> Bool {

    guard let url = AppLinks.shared.getUniversalLink(userActivity) else {
      return false
    }
    
    AppLinks.shared.handleLink(link: url.absoluteString)
    
    return false // Returning true will stop the propagation to other packages
  }
}
