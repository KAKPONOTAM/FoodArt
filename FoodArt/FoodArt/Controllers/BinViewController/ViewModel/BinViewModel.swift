import Foundation
import RealmSwift

final class BinViewModel {
    private let realmManager: RealmManager
    private lazy var _savedDishModels = Bindable<Results<SavedDishModel>?>(realmManager.retriveModels())
    
    var savedDishModels = Bindable<[SavedDishModel]>(.emptyCollection)
    var tableViewUpdates = Bindable<TableViewUpdates?>(.none)
    
    init(realmManager: RealmManager) {
        self.realmManager = realmManager
        checkInitialUpdates()
    }
    
    private func checkInitialUpdates() {
        realmManager.observe(models: _savedDishModels.value) { [unowned self] values in
            savedDishModels.value = Array(values).filter { !savedDishModels.value.contains($0) }
            tableViewUpdates.value = .reload
        }
    }
    
    func containedValueAmount(model: SavedDishModel) -> Int {
        let containedValueAmount = savedDishModels.value.filter { $0 == model }
        return containedValueAmount.isEmpty ? 1 : containedValueAmount.count
    }
    
    func recountSavedDishes(with amount: Int, savedDishModel: SavedDishModel) {
        if amount == .zero {
            if let index = savedDishModels.value.firstIndex(of: savedDishModel) {
                let indexPath = IndexPath(row: index, section: .zero)
                
                savedDishModels.value.remove(at: index)
                realmManager.remove(model: savedDishModel)
                tableViewUpdates.value = .deleteRows([indexPath], .automatic)
            }
        }
    }
}
