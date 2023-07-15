import UIKit

struct DishesSelectionModel {
    private init() {}
    private(set) static var selectedModels: (dishes: [Dish], images: [UIImage?]) = (.emptyCollection, .emptyCollection)
}

extension DishesSelectionModel {
    @discardableResult static func append(_ element: Dish, image: UIImage?) -> DishesSelectionAddingStates {
        selectedModels.dishes.append(element)
        selectedModels.images.append(image)
        
        if selectedModels.dishes.contains(element) {
            let containedElementsCount = selectedModels.dishes.filter { $0 == element }.count
            
            return .updateDishes(with: containedElementsCount)
        }
        
        return .newAdded
    }
    
    @discardableResult static func delete(index: Int) -> DishesSelectionAddingStates {
        selectedModels.dishes.remove(at: index)
        selectedModels.images.remove(at: index)
        
        return .delete
    }
}
