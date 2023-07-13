import Foundation

final class KitchenCategoryViewModel {
    private let router: MainRouter
    
    let kitchenCategory: KitchenCategory
    let dishesCategory: DishesCategory
    
    init(kitchenCategory: KitchenCategory, dishesCategory: DishesCategory, router: MainRouter) {
        self.kitchenCategory = kitchenCategory
        self.dishesCategory = dishesCategory
        self.router = router
    }
}
