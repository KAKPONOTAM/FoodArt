import Foundation

extension URL {
    init?(_ link: Links) {
        self.init(string: link.urlString)
    }
}

extension URL {
    public enum Links {
        case foodCategoryLink
        case dishesLink
        
        var urlString: String {
            switch self {
            case .foodCategoryLink:
                return "https://run.mocky.io/v3/058729bd-1402-4578-88de-265481fd7d54"
                
            case .dishesLink:
                return "https://run.mocky.io/v3/aba7ecaa-0a70-453b-b62d-0e326c859b3b"
            }
        }
    }
}
