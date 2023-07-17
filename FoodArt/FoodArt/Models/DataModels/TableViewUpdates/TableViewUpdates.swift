import UIKit

enum TableViewUpdates {
    case reloadRows([IndexPath], UITableView.RowAnimation)
    case deleteRows([IndexPath], UITableView.RowAnimation)
    case reload
}
