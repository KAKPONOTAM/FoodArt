import UIKit

final class ProductViewModel {
    private let router: MainRouter
    private let realmManager: RealmManager
    
    var dish = Bindable<Dish?>(.none)
    var dishImage = Bindable<UIImage?>(.none)
    
    init(dish: Dish?, dishImage: UIImage?, router: MainRouter, realmManager: RealmManager) {
        self.dish.value = dish
        self.dishImage.value = dishImage
        self.router = router
        self.realmManager = realmManager
    }
    
    func dismissButtonTapped() {
        router.dismiss()
    }
    
    func addDishButtonTapped() {
        guard let dish = dish.value,
              let imageData = dishImage.value?.pngData() else { return }

        let savedDishModel = SavedDishModel(dishName: dish.name, weight: dish.weight, price: dish.price, imageData: imageData)
        
        realmManager.saveСode(value: savedDishModel)
        router.dismiss()
    }
}
