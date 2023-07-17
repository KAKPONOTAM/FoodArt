import UIKit
import RealmSwift

@objcMembers
final class SavedDishModel: Object {
    dynamic var dishName: String = .emptyString
    dynamic var weight: Int = .zero
    dynamic var price: Int = .zero
    dynamic var imageData = Data()
    dynamic var primaryKey = UUID().uuidString
    
    override class func primaryKey() -> String? {
        return "primaryKey"
    }
    
    convenience init(dishName: String, weight: Int, price: Int, imageData: Data) {
        self.init()
        self.weight = weight
        self.dishName = dishName
        self.price = price
        self.imageData = imageData
    }
}
