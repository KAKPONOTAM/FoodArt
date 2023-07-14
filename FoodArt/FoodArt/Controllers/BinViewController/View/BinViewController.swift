import UIKit

final class BinViewController: UIViewController {
    private var viewModel: BinViewModel?
    
    private lazy var binTableView: UITableView = {
        let tableView = UITableView()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(BinTableViewCell.self, forCellReuseIdentifier: BinTableViewCell.reuseIdentifier)
        
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}

extension BinViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return .zero
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: BinTableViewCell.reuseIdentifier, for: indexPath) as? BinTableViewCell,
              let viewModel else { return UITableViewCell() }
        
        return cell
    }
}

extension BinViewController: ViewModelSetterProtocol {
    func set(_ viewModel: BinViewModel) {
        self.viewModel = viewModel
    }
}
