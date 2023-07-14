import UIKit

final class MainModuleBuilder {
    static func assemblyLaunchViewController(router: MainRouter) -> UIViewController {
        let launchViewController = LaunchViewController()
        let networkManager = NetworkManager()
        let viewModel = LaunchViewModel(networkManager: networkManager, router: router)
        
        launchViewController.set(viewModel)
        
        return launchViewController
    }
    
    static func assemblyKitchenCategoryViewController(kitchenCategoryDownloadedInfo: DownloadedInfo<KitchenCategory>, dishesCategoryDownloadedInfo: DownloadedInfo<DishesCategory>, router: MainRouter) -> UIViewController {
        let viewModel = KitchenCategoryViewModel(kitchenCategoryDownloadedInfo: kitchenCategoryDownloadedInfo, dishesCategoryDownloadedInfo: dishesCategoryDownloadedInfo, router: router)
        let kitchenCategoryViewController = KitchenCategoryViewController()
        
        kitchenCategoryViewController.set(viewModel)
        
        let navigationController = UINavigationController(rootViewController: kitchenCategoryViewController)
        
        return navigationController
    }
}
