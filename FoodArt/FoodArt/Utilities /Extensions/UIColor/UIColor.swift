import UIKit

extension UIColor {
    convenience init?(_ color: Colors) {
        self.init(named: color.colorName)
    }
    
    public enum Colors {
        case customBlue
        case customLightGray
        case lightBackgroundColor
        
        var colorName: String {
            switch self {
            case .customBlue:
                return "customBlue"
                
            case .customLightGray:
                return "customLightGray"
                
            case .lightBackgroundColor:
                return "lightBackgroundColor"
            }
        }
    }
}
