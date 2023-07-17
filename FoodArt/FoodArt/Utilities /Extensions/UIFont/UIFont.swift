import UIKit

extension UIFont {
    convenience init?(font: Fonts, fontSize: CGFloat) {
        self.init(name: font.fontName, size: fontSize)
    }
    
    public enum Fonts {
        case displayRegular
        
        var fontName: String {
            switch self {
            case .displayRegular:
                return "SFProDisplay-Regular"
            }
        }
    }
}
