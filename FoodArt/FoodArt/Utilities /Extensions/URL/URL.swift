import Foundation

extension URL {
    init?(_ link: Links) {
        self.init(string: link.urlString)
    }
}

extension URL {
    public enum Links {
        case foodTypeLink
        case dishesLink
        
        var urlString: String {
            switch self {
            case .foodTypeLink:
                return .emptyString
                
            case .dishesLink:
                return .emptyString
            }
        }
    }
}
