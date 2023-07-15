import Foundation

enum RootViewControllerCoordinator {
    case kitchenCategory(DownloadedInfo<KitchenCategory>, DownloadedInfo<DishesCategory>)
    case dishesCategory(DownloadedInfo<KitchenCategory>, DownloadedInfo<DishesCategory>, title: String?)
}
