import Foundation
import CoreLocation

final class KitchenCategoryViewModel {
    private let router: MainRouter
    
    let kitchenCategoryDownloadedInfo: DownloadedInfo<KitchenCategory>
    let dishesCategoryDownloadedInfo: DownloadedInfo<DishesCategory>
    
    init(kitchenCategoryDownloadedInfo: DownloadedInfo<KitchenCategory>, dishesCategoryDownloadedInfo: DownloadedInfo<DishesCategory>, router: MainRouter) {
        self.kitchenCategoryDownloadedInfo = kitchenCategoryDownloadedInfo
        self.dishesCategoryDownloadedInfo = dishesCategoryDownloadedInfo
        self.router = router
    }
    
    func pushDishesViewController(index: Int) {
        let selectedKitchenCategory = kitchenCategoryDownloadedInfo.downloadedInfo.сategories[index].name
        router.changeRootViewController(depends: .dishesCategory(kitchenCategoryDownloadedInfo, dishesCategoryDownloadedInfo, title: selectedKitchenCategory))
    }
}
