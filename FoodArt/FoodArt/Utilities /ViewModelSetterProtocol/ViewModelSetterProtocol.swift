import Foundation

protocol ViewModelSetterProtocol: AnyObject {
    associatedtype ViewModel
    func set(_ viewModel: ViewModel)
}

