import Foundation

final class DishesCategoryViewModel {
    let dishesCategoryDownloadedInfo: DownloadedInfo<DishesCategory>
    private let router: MainRouter
    
    init(dishesCategoryDownloadedInfo: DownloadedInfo<DishesCategory>, router: MainRouter) {
        self.dishesCategoryDownloadedInfo = dishesCategoryDownloadedInfo
        self.router = router
    }
    
    func presentProductViewController(index: Int) {
        let dish = dishesCategoryDownloadedInfo.downloadedInfo.dishes[index]
        let image = dishesCategoryDownloadedInfo.images[index]
        
        router.presentProductViewController(image: image, dish: dish)
    }
    
    func backButtonTapped() {
        
    }
}
