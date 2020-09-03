import UIKit
import Flutter
import GoogleMaps

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {

    let controller : FlutterViewController = window?.rootViewController as! FlutterViewController
    let appIconChannel = FlutterMethodChannel(name: "appIconChannel", binaryMessenger: controller as! FlutterBinaryMessenger)
     
     appIconChannel.setMethodCallHandler({
         [weak self](call: FlutterMethodCall, result: FlutterResult) -> Void in
         guard call.method == "changeIcon" else {
             result(FlutterMethodNotImplemented)
             return
         }
         self?.changeAppIcon(call: call)
     })
     
     GeneratedPluginRegistrant.register(with: self)
    
     GMSServices.provideAPIKey("AIzaSyCArN4KV3miXp4X52PSVZydl3AGFbsPdag")
    
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
    
    private func changeAppIcon(call: FlutterMethodCall){
        if #available(iOS 10.3, *) {
            guard UIApplication.shared.supportsAlternateIcons else {
                return
            }

                let arguments : String = call.arguments as! String
                       
                if arguments == "Green" {
                    UIApplication.shared.setAlternateIconName("Green")
                } else if arguments == "Blue" {
                    UIApplication.shared.setAlternateIconName("Blue")
                } else if arguments == "Bronze" {
                    UIApplication.shared.setAlternateIconName("Bronze")
                } else if arguments == "Black" {
                    UIApplication.shared.setAlternateIconName("Black")
                } else if arguments == "Outrun" {
                    UIApplication.shared.setAlternateIconName("Outrun")
                } else {
                    UIApplication.shared.setAlternateIconName(nil)
                }
                   
           } else {
               // Fallback on earlier versions
           }
           
       }
}
