import UIKit

final class MainModuleBuilder {
    static func assemblyLaunchViewController() -> UIViewController {
        let router = MainRouter()
        let launchViewController = LaunchViewController()
        let networkManager = NetworkManager()
        let viewModel = LaunchViewModel(networkManager: networkManager, router: router)
        
        launchViewController.set(viewModel)
        
        return launchViewController
    }
}
