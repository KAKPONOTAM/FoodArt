import Foundation

enum ModuleTitles {
    case mainTitle
    case binTitle
    case addDishTitle
    
    var title: String? {
        switch self {
        case .mainTitle:
            return "Главная"
            
        case .binTitle:
            return "Корзина"
            
        case .addDishTitle:
            return "Добавить в корзину"
        }
    }
}
