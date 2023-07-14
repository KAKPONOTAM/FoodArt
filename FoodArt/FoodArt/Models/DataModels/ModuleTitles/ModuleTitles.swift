import Foundation

enum ModuleTitles {
    case mainTitle
    
    var title: String? {
        switch self {
        case .mainTitle:
            return "Главная"
        }
    }
}
