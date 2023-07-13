import UIKit

final class AppBuilder {
    private var window: UIWindow?
    private let router = MainRouter()
    
     init(window: UIWindow?) {
        self.window = window
    }
    
    func createMainModule() {
        window?.rootViewController = router.start()
        window?.backgroundColor = .white
        window?.makeKeyAndVisible()
    }
}
