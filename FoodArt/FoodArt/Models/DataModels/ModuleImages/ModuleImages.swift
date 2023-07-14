import UIKit

enum ModuleImages {
    case mainSegmentIcon
    case searchSegmentIcon
    case binSegmentIcon
    case accountSegmentIcon
    
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
        }
    }
}
