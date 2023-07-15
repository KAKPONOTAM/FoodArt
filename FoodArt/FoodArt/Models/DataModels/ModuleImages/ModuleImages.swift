import UIKit

enum ModuleImages {
    case mainSegmentIcon
    case searchSegmentIcon
    case binSegmentIcon
    case accountSegmentIcon
    case heartImage
    case dismissImage
    
    var icon: UIImage {
        switch self {
        case .mainSegmentIcon:
            return UIImage(named: "mainSegmentIcon") ?? .actions
            
        case .searchSegmentIcon:
            return UIImage(named: "searchSegmentIcon") ?? .actions
            
        case .binSegmentIcon:
            return UIImage(named: "binSegmentIcon") ?? .actions
            
        case .accountSegmentIcon:
            return UIImage(named: "accountSegmentIcon") ?? .add
            
        case .heartImage:
            return UIImage(named: "heartImage") ?? .add
            
        case .dismissImage:
            return UIImage(named: "dismissImage") ?? .actions
        }
    }
}
