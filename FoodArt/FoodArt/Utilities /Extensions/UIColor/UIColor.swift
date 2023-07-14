import UIKit

extension UIColor {
    convenience init?(_ color: Colors) {
        self.init(named: color.colorName)
    }
    
    public enum Colors {
        case customBlue
        
        var colorName: String {
            switch self {
            case .customBlue:
                return "customBlue"
            }
        }
    }
}
