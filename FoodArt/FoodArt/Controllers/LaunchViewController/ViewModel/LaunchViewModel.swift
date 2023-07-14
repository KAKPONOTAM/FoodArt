import UIKit

final class LaunchViewModel {
    private let networkManager: NetworkManager
    private let router: MainRouter
    
    init(networkManager: NetworkManager, router: MainRouter) {
        self.networkManager = networkManager
        self.router = router
    }
    
    //MARK: - download all info on launch view to pass all info without any network layer after
    func downloadInfo() {
        Task {
            do {
                var kitchenCategoryImages: [UIImage?] = .emptyCollection
                var dishesCategoryImages: [UIImage?] = .emptyCollection
                
                let kitchenCategories: KitchenCategory = try await networkManager.downloadData(.foodCategoryLink)
                let dishesCategory: DishesCategory = try await networkManager.downloadData(.dishesLink)
                
                for kitchenCategory in kitchenCategories.сategories {
                    let kitchenCategoryImage = try await networkManager.downloadImage(urlAbsoluteString: kitchenCategory.image_url)
                    kitchenCategoryImages.append(kitchenCategoryImage)
                }
                
                for dishesCategory in dishesCategory.dishes {
                    let dishesCategoryImage = try await networkManager.downloadImage(urlAbsoluteString: dishesCategory.image_url)
                    dishesCategoryImages.append(dishesCategoryImage)
                }
                
                let kitchenCategoryDownloadedInfo = DownloadedInfo(kitchenCategories, kitchenCategoryImages)
                let dishesCategoryDownloadedInfo = DownloadedInfo(dishesCategory, dishesCategoryImages)
                
                await MainActor.run {
                    router.presentKitchenCategoryViewController(kitchenCategoryDownloadedInfo: kitchenCategoryDownloadedInfo, dishesCategoryDownloadedInfo: dishesCategoryDownloadedInfo)
                }
                
            } catch let error as NetworkError {
                print(error.localizedDescription)
            }
        }
    }
}
