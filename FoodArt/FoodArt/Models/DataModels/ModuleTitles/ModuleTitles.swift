import Foundation

enum ModuleTitles {
    case mainTitle
    case binTitle
    case addDishTitle
    case searchTitle
    case accountTitle
    case pay
    
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
            
        case .pay:
            return "Оплатить"
        }
    }
}
