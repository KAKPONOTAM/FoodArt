import UIKit

final class MainRouter {
    private(set) lazy var controller = MainModuleBuilder.assemblyLaunchViewController(router: self)
}

extension MainRouter {
    func changeRootViewController(depends coordinator: RootViewControllerCoordinator) {
        controller = MainModuleBuilder.assemblyMainViewController(depends: coordinator, router: self, savedDishModels: .emptyCollection)
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate,
              let window = appDelegate.window else { return }
        
        appDelegate.appBuilder?.createMainModule()
        
        UIView.transition(with: window, duration: 0.5, options: .transitionCrossDissolve, animations: .none, completion: .none)
    }
    
    func presentProductViewController(image: UIImage?, dish: Dish) {
        let productViewController = MainModuleBuilder.assemblyProductViewController(image: image, dish: dish, router: self)
        productViewController.modalPresentationStyle = .overFullScreen
        
        controller.present(productViewController, animated: true)
    }
}

extension MainRouter {
    func dismiss(completion: (() -> Void)? = .none) {
        controller.dismiss(animated: true, completion: completion)
    }
    
    func popViewController() {
        controller.navigationController?.popViewController(animated: true)
    }
}
