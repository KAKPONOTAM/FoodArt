import UIKit

final class MainModuleBuilder {
    private init() {}
    
    static func assemblyLaunchViewController(router: MainRouter) -> UIViewController {
        let launchViewController = LaunchViewController()
        let networkManager = NetworkManager()
        let viewModel = LaunchViewModel(networkManager: networkManager, router: router)
        
        launchViewController.set(viewModel)
        
        return launchViewController
    }
    
    static func assemblyMainViewController(kitchenCategoryDownloadedInfo: DownloadedInfo<KitchenCategory>, dishesCategoryDownloadedInfo: DownloadedInfo<DishesCategory>, router: MainRouter) -> UIViewController {
        let kitchenCategoryViewController = assemblyKitchenCategoryViewController(kitchenCategoryDownloadedInfo: kitchenCategoryDownloadedInfo, dishesCategoryDownloadedInfo: dishesCategoryDownloadedInfo, router: router)
        let tabBarViewController = UITabBarController()
        
        kitchenCategoryViewController.tabBarItem = UITabBarItem(title: ModuleTitles.mainTitle.title, image: ModuleImages.mainSegmentIcon.icon, selectedImage: ModuleImages.mainSegmentIcon.icon.withTintColor(UIColor(.customBlue) ?? .black))
        
        tabBarViewController.viewControllers = [kitchenCategoryViewController]
        let navigationController = UINavigationController(rootViewController: tabBarViewController)
        
        return navigationController
    }
    
    static func assemblyDishesCategoryViewController(dishesCategoryDownloadedInfo: DownloadedInfo<DishesCategory>, router: MainRouter) -> UIViewController {
        let viewModel = DishesCategoryViewModel(dishesCategoryDownloadedInfo: dishesCategoryDownloadedInfo, router: router)
        let dishesViewController = DishesCategoryViewController()
        
        dishesViewController.set(viewModel)
        
        return dishesViewController
    }
}

//MARK: - assembly tabBar viewControllers
extension MainModuleBuilder {
    private static func assemblyKitchenCategoryViewController(kitchenCategoryDownloadedInfo: DownloadedInfo<KitchenCategory>, dishesCategoryDownloadedInfo: DownloadedInfo<DishesCategory>, router: MainRouter) -> UIViewController {
        let viewModel = KitchenCategoryViewModel(kitchenCategoryDownloadedInfo: kitchenCategoryDownloadedInfo, dishesCategoryDownloadedInfo: dishesCategoryDownloadedInfo, router: router)
        let kitchenCategoryViewController = KitchenCategoryViewController()
        
        kitchenCategoryViewController.set(viewModel)
        
        return kitchenCategoryViewController
    }
}
