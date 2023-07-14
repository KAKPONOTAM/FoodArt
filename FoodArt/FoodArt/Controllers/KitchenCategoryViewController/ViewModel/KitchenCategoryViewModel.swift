import Foundation

final class KitchenCategoryViewModel {
    private let router: MainRouter
    
    let kitchenCategoryDownloadedInfo: DownloadedInfo<KitchenCategory>
    let dishesCategoryDownloadedInfo: DownloadedInfo<DishesCategory>
    
    init(kitchenCategoryDownloadedInfo: DownloadedInfo<KitchenCategory>, dishesCategoryDownloadedInfo: DownloadedInfo<DishesCategory>, router: MainRouter) {
        self.kitchenCategoryDownloadedInfo = kitchenCategoryDownloadedInfo
        self.dishesCategoryDownloadedInfo = dishesCategoryDownloadedInfo
        self.router = router
    }
    
    func pushDishesViewController() {
        router.pushDishesViewController(dishesCategoryDownloadedInfo: dishesCategoryDownloadedInfo)
    }
}
