import UIKit

final class MainModuleBuilder {
    static func assemblyLaunchViewController() -> UIViewController {
        let launchViewController = LaunchViewController()
        let networkManager = NetworkManager()
        let viewModel = LaunchViewModel(networkManager: networkManager)
        
        launchViewController.set(viewModel)
        
        return launchViewController
    }
}
