import Foundation

enum ModuleTitles {
    case mainTitle
    case binTitle
    case addDishTitle
    case searchTitle
    case accountTitle
    
    var title: String? {
        switch self {
        case .mainTitle:
            return "Главная"
            
        case .binTitle:
            return "Корзина"
            
        case .searchTitle:
            return "Поиск"
            
        case .accountTitle:
            return "Аккаунт"
            
        case .addDishTitle:
            return "Добавить в корзину"
        }
    }
}
