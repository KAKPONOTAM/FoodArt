import Foundation

final class LaunchViewModel {
    private let networkManager: NetworkManager
    private let router: MainRouter
    
    init(networkManager: NetworkManager, router: MainRouter) {
        self.networkManager = networkManager
        self.router = router
    }
    
    func downloadInfo() {
        Task {
            do {
                let kitchenCategory: KitchenCategory = try await networkManager.downloadData(.foodCategoryLink)
                let dishesCategory: DishesCategory = try await networkManager.downloadData(.dishesLink)
                
            } catch let error as NetworkError {
                print(error.localizedDescription)
            }
        }
    }
}
