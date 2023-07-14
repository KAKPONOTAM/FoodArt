import UIKit

final class MainRouter {
    private(set) lazy var controller = MainModuleBuilder.assemblyLaunchViewController(router: self)
    
    func presentKitchenCategoryViewController(kitchenCategoryDownloadedInfo: DownloadedInfo<KitchenCategory>, dishesCategoryDownloadedInfo: DownloadedInfo<DishesCategory>) {
        controller = MainModuleBuilder.assemblyKitchenCategoryViewController(kitchenCategoryDownloadedInfo: kitchenCategoryDownloadedInfo, dishesCategoryDownloadedInfo: dishesCategoryDownloadedInfo, router: self)
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate,
              let window = appDelegate.window else { return }
        
        appDelegate.appBuilder?.createMainModule()
        
        UIView.transition(with: window, duration: 0.5, options: .transitionCrossDissolve, animations: .none, completion: .none)
    }
    
    func dismiss(completion: (() -> Void)?) {
        controller.dismiss(animated: true, completion: completion)
    }
}
