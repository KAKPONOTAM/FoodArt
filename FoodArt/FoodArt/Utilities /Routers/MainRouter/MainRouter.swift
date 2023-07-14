import UIKit

final class MainRouter {
    private(set) lazy var controller = MainModuleBuilder.assemblyLaunchViewController(router: self)
}

extension MainRouter {
    func presentKitchenCategoryViewController(kitchenCategoryDownloadedInfo: DownloadedInfo<KitchenCategory>, dishesCategoryDownloadedInfo: DownloadedInfo<DishesCategory>) {
        controller = MainModuleBuilder.assemblyMainViewController(kitchenCategoryDownloadedInfo: kitchenCategoryDownloadedInfo, dishesCategoryDownloadedInfo: dishesCategoryDownloadedInfo, router: self)
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate,
              let window = appDelegate.window else { return }
        
        appDelegate.appBuilder?.createMainModule()
        
        UIView.transition(with: window, duration: 0.5, options: .transitionCrossDissolve, animations: .none, completion: .none)
    }
    
    func pushDishesViewController(dishesCategoryDownloadedInfo: DownloadedInfo<DishesCategory>) {
        let dishesViewController = MainModuleBuilder.assemblyDishesCategoryViewController(dishesCategoryDownloadedInfo: dishesCategoryDownloadedInfo, router: self)
        
        if let navigationController = controller as? UINavigationController {
            navigationController.pushViewController(dishesViewController, animated: true)
        }
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
