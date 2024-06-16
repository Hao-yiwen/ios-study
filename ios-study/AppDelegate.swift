import UIKit
import Flutter
import FlutterPluginRegistrant
import CoreData

@UIApplicationMain
class AppDelegate: FlutterAppDelegate { // More on the FlutterAppDelegate.
    var mainWindow: UIWindow?

    override var window: UIWindow? {
        get {
            return mainWindow
        }
        set {
            mainWindow = newValue
        }
    }
    
    lazy var flutterEngine = FlutterEngine(name: "my flutter engine")
    
    let coreStack = CoreDataStack.shared

    override func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Runs the default Dart entrypoint with a default Flutter route.
        DispatchQueue.main.async {
            self.flutterEngine.run()
            // Connects plugins with iOS platform code to this app.
            GeneratedPluginRegistrant.register(with: self.flutterEngine)
        }
        return super.application(application, didFinishLaunchingWithOptions: launchOptions)
    }
    
    override func applicationWillTerminate(_ application: UIApplication) {
        coreStack.saveContext()
    }
    
    override func applicationDidEnterBackground(_ application: UIApplication) {
        coreStack.saveContext()
    }
}
