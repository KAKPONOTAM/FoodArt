import Foundation

enum ModuleTitles {
    case mainTitle
    case binTitle
    
    var title: String? {
        switch self {
        case .mainTitle:
            return "Главная"
            
        case .binTitle:
            return "Корзина"
        }
    }
}
