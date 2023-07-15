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
    
    static func assemblyMainViewController(depends coordinator: RootViewControllerCoordinator, router: MainRouter) -> UIViewController {
        let binViewController = assemblyBinViewController()
        let searchViewController = assemblySearchViewController()
        let accountViewController = assemblyAccountViewController()
        
        let tabBarViewController = UITabBarController()
        
        switch coordinator {
        case .kitchenCategory(let kitchenCategoryDownloadedInfo, let dishesCategoryDownloadedInfo):
            let kitchenCategoryViewController = assemblyKitchenCategoryViewController(kitchenCategoryDownloadedInfo: kitchenCategoryDownloadedInfo, dishesCategoryDownloadedInfo: dishesCategoryDownloadedInfo, router: router)
            
            tabBarViewController.viewControllers = [kitchenCategoryViewController, searchViewController, binViewController, accountViewController]
            
        case .dishesCategory(let kitchenCategoryDownloadedInfo, let dishesCategoryDownloadedInfo, let title):
            let dishesViewController = assemblyDishesCategoryViewController(kitchenCategoryDownloadedInfo: kitchenCategoryDownloadedInfo, dishesCategoryDownloadedInfo: dishesCategoryDownloadedInfo, router: router, selectedKitchenCategoryTitle: title)
            
            tabBarViewController.viewControllers = [dishesViewController, searchViewController, binViewController, accountViewController]
        }
        
        let navigationController = UINavigationController(rootViewController: tabBarViewController)
        
        return navigationController
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
        kitchenCategoryViewController.tabBarController?.navigationController?.setNavigationBarHidden(true, animated: false)
        
        return kitchenCategoryViewController
    }
    
    private static func assemblyBinViewController() -> UIViewController {
        let binViewController = BinViewController()
        let binViewModel = BinViewModel()
        
        binViewController.set(binViewModel)
        binViewController.tabBarItem = UITabBarItem(title: ModuleTitles.binTitle.title, image: ModuleImages.binSegmentIcon.icon, selectedImage: ModuleImages.binSegmentIcon.icon.withTintColor(UIColor(.customBlue) ?? .black))
        
        return binViewController
    }
    
    private static func assemblyDishesCategoryViewController(kitchenCategoryDownloadedInfo: DownloadedInfo<KitchenCategory>, dishesCategoryDownloadedInfo: DownloadedInfo<DishesCategory>, router: MainRouter, selectedKitchenCategoryTitle: String?) -> UIViewController {
        let viewModel = DishesCategoryViewModel(dishesCategoryDownloadedInfo: dishesCategoryDownloadedInfo, kitchenCategoryDownloadedInfo: kitchenCategoryDownloadedInfo, router: router, selectedKitchenCategoryTitle: selectedKitchenCategoryTitle)
        let dishesViewController = DishesCategoryViewController()
        
        dishesViewController.tabBarItem = UITabBarItem(title: ModuleTitles.mainTitle.title, image: ModuleImages.mainSegmentIcon.icon, selectedImage: ModuleImages.mainSegmentIcon.icon.withTintColor(UIColor(.customBlue) ?? .black))
        dishesViewController.set(viewModel)
        
        return dishesViewController
    }
    
    private static func assemblySearchViewController() -> UIViewController {
        let searchViewController = UIViewController()
        searchViewController.view.backgroundColor = .white
        
        searchViewController.tabBarItem = UITabBarItem(title: ModuleTitles.searchTitle.title, image: ModuleImages.searchSegmentIcon.icon, selectedImage: ModuleImages.searchSegmentIcon.icon.withTintColor(UIColor(.customBlue) ?? .black))
        
        return searchViewController
    }
    
    private static func assemblyAccountViewController() -> UIViewController {
        let accountViewController = UIViewController()
        accountViewController.view.backgroundColor = .white
        
        accountViewController.tabBarItem = UITabBarItem(title: ModuleTitles.accountTitle.title, image: ModuleImages.accountSegmentIcon.icon, selectedImage: ModuleImages.accountSegmentIcon.icon.withTintColor(UIColor(.customBlue) ?? .black))
        
        return accountViewController
    }
}
