import UIKit

final class ProductViewModel {
    private let router: MainRouter
    
    var dish = Bindable<Dish?>(.none)
    var dishImage = Bindable<UIImage?>(.none)
    
    init(dish: Dish?, dishImage: UIImage?, router: MainRouter) {
        self.dish.value = dish
        self.dishImage.value = dishImage
        self.router = router
    }
    
    func dismissButtonTapped() {
        router.dismiss()
    }
}
