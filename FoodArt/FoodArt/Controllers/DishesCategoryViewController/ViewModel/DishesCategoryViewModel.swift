import Foundation

final class DishesCategoryViewModel {
    private let router: MainRouter
    private let kitchenCategoryDownloadedInfo: DownloadedInfo<KitchenCategory> //MARK: - saving this data for rechangeRootVC
    
    let dishesCategoryDownloadedInfo: DownloadedInfo<DishesCategory> //MARK: - saving this data for create cells
    
    var selectedKitchenCategoryTitle = Bindable<String?>(.none)
    
    init(dishesCategoryDownloadedInfo: DownloadedInfo<DishesCategory>, kitchenCategoryDownloadedInfo: DownloadedInfo<KitchenCategory>, router: MainRouter, selectedKitchenCategoryTitle: String?) {
        self.dishesCategoryDownloadedInfo = dishesCategoryDownloadedInfo
        self.kitchenCategoryDownloadedInfo = kitchenCategoryDownloadedInfo
        self.router = router
        self.selectedKitchenCategoryTitle.value = selectedKitchenCategoryTitle
    }
    
    func presentProductViewController(index: Int) {
        let dish = dishesCategoryDownloadedInfo.downloadedInfo.dishes[index]
        let image = dishesCategoryDownloadedInfo.images[index]
        
        router.presentProductViewController(image: image, dish: dish)
    }
    
    func backButtonTapped() {
        router.changeRootViewController(depends: .kitchenCategory(kitchenCategoryDownloadedInfo, dishesCategoryDownloadedInfo))
    }
}
