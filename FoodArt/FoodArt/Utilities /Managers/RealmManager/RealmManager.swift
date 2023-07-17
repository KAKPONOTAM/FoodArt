import Foundation
import RealmSwift

final class RealmManager {
    private var receiveToken: NotificationToken?
    
    private let realm: Realm? = {
        let realm = try? Realm()
        return realm
    }()
    
    func saveСode<T: SavedDishModel>(value: T)  {
        do {
            try? realm?.write {
                realm?.add(value)
            }
        }
    }
    
    func remove<T: SavedDishModel>(model: T) {
        do {
            try? realm?.write {
                 realm?.delete(model)
            }
        }
    }
    
    func retriveModels<T: SavedDishModel>() -> Results<T>? {
        return realm?.objects(T.self)
    }
    
    @discardableResult func observe(models: Results<SavedDishModel>?, completion: @escaping (Results<SavedDishModel>) -> Void) -> NotificationToken? {
        receiveToken = models?.observe {
            switch $0 {
            case .initial(let result):
                completion(result)
                
            case .update(let result, deletions: _, insertions: _, modifications:_):
                completion(result)
                
            case .error(let error):
                debugPrint(error.localizedDescription)
            }
        }
        
        return receiveToken
    }
}
