import UIKit

extension UIImageView {
    convenience init(_ moduleImage: ModuleImages) {
        self.init(image: moduleImage.image)
    }
}

extension UIImageView {
    public enum ModuleImages {
        case launchImage
        case navigationBarTitleImage
        case locationImage
        
        var image: UIImage? {
            switch self {
            case .launchImage:
                return UIImage(named: "launchImage")
                
            case .navigationBarTitleImage:
                return UIImage(named: "navigationBarTitleImage") ?? .actions
                
            case .locationImage:
                return UIImage(named: "LocationImage") ?? .actions
            }
        }
    }
}
