import Flutter
import UIKit

@main
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }

  @MainActor
  func open(
    _ url: URL,
    options: [UIApplication.OpenExternalURLOptionsKey : Any] = [:],
    completionHandler completion: (@MainActor (Bool) -> Void)? = nil
  )
}
