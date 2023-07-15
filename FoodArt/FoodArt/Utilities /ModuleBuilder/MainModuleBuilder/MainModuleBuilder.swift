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
        let binViewController = assemblyBinViewController()
        
        let tabBarViewController = UITabBarController()
        
        tabBarViewController.viewControllers = [kitchenCategoryViewController, binViewController]
        let navigationController = UINavigationController(rootViewController: tabBarViewController)
        
        return navigationController
    }
    
    static func assemblyDishesCategoryViewController(dishesCategoryDownloadedInfo: DownloadedInfo<DishesCategory>, router: MainRouter) -> UIViewController {
        let viewModel = DishesCategoryViewModel(dishesCategoryDownloadedInfo: dishesCategoryDownloadedInfo, router: router)
        let dishesViewController = DishesCategoryViewController()
        
        dishesViewController.set(viewModel)
        
        return dishesViewController
    }
    
    static func assemblyProductViewController(image: UIImage?, dish: Dish, router: MainRouter) -> UIViewController {
        let productViewController = ProductViewController()
        let viewModel = ProductViewModel(dish: dish, dishImage: image, router: router)
        
        productViewController.set(viewModel)
        
        return productViewController
    }
}

//MARK: - assembly tabBar viewControllers
extension MainModuleBuilder {
    private static func assemblyKitchenCategoryViewController(kitchenCategoryDownloadedInfo: DownloadedInfo<KitchenCategory>, dishesCategoryDownloadedInfo: DownloadedInfo<DishesCategory>, router: MainRouter) -> UIViewController {
        let viewModel = KitchenCategoryViewModel(kitchenCategoryDownloadedInfo: kitchenCategoryDownloadedInfo, dishesCategoryDownloadedInfo: dishesCategoryDownloadedInfo, router: router)
        let kitchenCategoryViewController = KitchenCategoryViewController()
        
        kitchenCategoryViewController.tabBarItem = UITabBarItem(title: ModuleTitles.mainTitle.title, image: ModuleImages.mainSegmentIcon.icon, selectedImage: ModuleImages.mainSegmentIcon.icon.withTintColor(UIColor(.customBlue) ?? .black))
        kitchenCategoryViewController.set(viewModel)
        
        return kitchenCategoryViewController
    }
    
    private static func assemblyBinViewController() -> UIViewController {
        let binViewController = BinViewController()
        let binViewModel = BinViewModel(dishesSelectionModels: DishesSelectionModel.selectedModels)
        
        binViewController.set(binViewModel)
        binViewController.tabBarItem = UITabBarItem(title: ModuleTitles.binTitle.title, image: ModuleImages.binSegmentIcon.icon, selectedImage: ModuleImages.binSegmentIcon.icon.withTintColor(UIColor(.customBlue) ?? .black))
        
        let navigationController = UINavigationController(rootViewController: binViewController)
        
        return navigationController
    }
}
