import Foundation

final class DishesCategoryViewModel {
    let dishesCategoryDownloadedInfo: DownloadedInfo<DishesCategory>
    private let router: MainRouter
    
    init(dishesCategoryDownloadedInfo: DownloadedInfo<DishesCategory>, router: MainRouter) {
        self.dishesCategoryDownloadedInfo = dishesCategoryDownloadedInfo
        self.router = router
    }
    
    func dismiss() {
        router.dismiss()
    }
}
