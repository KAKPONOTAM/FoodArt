import UIKit

final class MainRouter {
    private var controller: UIViewController?
    
    func start() -> UIViewController? {
        controller = MainModuleBuilder.assemblyLaunchViewController()
        return controller
    }
}
