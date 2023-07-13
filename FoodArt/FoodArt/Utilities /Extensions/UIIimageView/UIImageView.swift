import UIKit

extension UIImageView {
    convenience init(_ moduleImage: ModuleImages) {
        self.init(image: moduleImage.image)
    }
}

extension UIImageView {
    public enum ModuleImages {
        case launchImage
        
        var image: UIImage? {
            switch self {
            case .launchImage:
                return UIImage(named: "launchImage")
            }
        }
    }
}
