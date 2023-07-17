import Foundation
import UIKit

final class DishesCategoryViewModel {
    private let router: MainRouter
    private let kitchenCategoryDownloadedInfo: DownloadedInfo<KitchenCategory> //MARK: - saving this data for rechangeRootVC
    private let dishesCategoryDownloadedInfo: DownloadedInfo<DishesCategory> //MARK: - saving this data for create cells
    
    var selectedKitchenCategoryTitle = Bindable<String?>(.none)
    var foodCategoryTitles = Bindable<[String]>(.emptyCollection)
    var dishesCategoryDownloadedModels: Bindable<DownloadedInfo<DishesCategory>>
    
    init(dishesCategoryDownloadedInfo: DownloadedInfo<DishesCategory>, kitchenCategoryDownloadedInfo: DownloadedInfo<KitchenCategory>, router: MainRouter, selectedKitchenCategoryTitle: String?) {
        self.dishesCategoryDownloadedInfo = dishesCategoryDownloadedInfo
        self.kitchenCategoryDownloadedInfo = kitchenCategoryDownloadedInfo
        self.router = router
        self.selectedKitchenCategoryTitle.value = selectedKitchenCategoryTitle
        self.dishesCategoryDownloadedModels = Bindable(dishesCategoryDownloadedInfo)
        
        configureFoodCategoryTitles()
    }
    
    func presentProductViewController(index: Int) {
        let dish = dishesCategoryDownloadedModels.value.downloadedInfo.dishes[index]
        let image = dishesCategoryDownloadedModels.value.images[dish.image_url, default: .actions]
        
        router.presentProductViewController(image: image, dish: dish)
    }
    
    func backButtonTapped() {
        router.changeRootViewController(depends: .kitchenCategory(kitchenCategoryDownloadedInfo, dishesCategoryDownloadedInfo))
    }
    
    func filterTags(_ tag: String) {
        var dishImages: [String: UIImage?] = .emptyCollection
        let filteredDishes = dishesCategoryDownloadedInfo.downloadedInfo.dishes.filter { $0.tegs.contains(tag) }
        
        filteredDishes.forEach { dishImages[$0.image_url] = dishesCategoryDownloadedInfo.images[$0.image_url] }
        
        let dishesCategory = DishesCategory(dishes: filteredDishes)
        let downloadedInfo = DownloadedInfo(downloadedInfo: dishesCategory, images: dishImages)
        
        self.dishesCategoryDownloadedModels.value = downloadedInfo
    }
}

extension DishesCategoryViewModel {
    private func configureFoodCategoryTitles() {
        let foodCategoryTags = dishesCategoryDownloadedInfo.downloadedInfo.dishes.map { $0 }.flatMap { $0.tegs }
        let orderedSet = NSOrderedSet(array: foodCategoryTags)
        
        if let tags = orderedSet.array as? [String] {
            self.foodCategoryTitles.value = tags
        }
    }
}
