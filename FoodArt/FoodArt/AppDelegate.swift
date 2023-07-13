import UIKit

@main
final class AppDelegate: UIResponder, UIApplicationDelegate {
    private var appBuilder: AppBuilder?
    private let screen = UIScreen()
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        
        appBuilder = AppBuilder(window: window)
        appBuilder?.createMainModule()
        
        return true
    }
}

