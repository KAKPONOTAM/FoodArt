import UIKit

final class MainModuleBuilder {
    static func assemblyLaunchViewController(router: MainRouter) -> UIViewController {
        let launchViewController = LaunchViewController()
        let networkManager = NetworkManager()
        let viewModel = LaunchViewModel(networkManager: networkManager, router: router)
        
        launchViewController.set(viewModel)
        
        return launchViewController
    }
    
    static func assemblyKitchenCategoryViewController(kitchenCategory: KitchenCategory, dishesCategory: DishesCategory, router: MainRouter) -> UIViewController {
        let viewModel = KitchenCategoryViewModel(kitchenCategory: kitchenCategory, dishesCategory: dishesCategory, router: router)
        let kitchenCategoryViewController = KitchenCategoryViewController()
        
        kitchenCategoryViewController.set(viewModel)
        
        let navigationController = UINavigationController(rootViewController: kitchenCategoryViewController)
        
        return navigationController
    }
}
