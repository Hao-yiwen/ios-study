import UIKit
import CoreData

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate { // More on the FlutterAppDelegate.
    var window: UIWindow?
    
    let coreStack = CoreDataStack.shared

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // 注册所有插件
        // 注册通知订阅中心
        DispatchQueue.main.async {
            LFNotificationCenter.registerNotificationObservers()
        }
        return true
    }
    
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }
    
    
    func applicationWillTerminate(_ application: UIApplication) {
        coreStack.saveContext()
        LFNotificationCenter.unregisterNotificationObservers()
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        coreStack.saveContext()
    }
}
