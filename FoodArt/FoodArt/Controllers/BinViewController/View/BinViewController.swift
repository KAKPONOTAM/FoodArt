import UIKit
import SnapKit

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
        addSubview()
        setupConstraints()
    }
}

extension BinViewController {
    private func addSubview() {
        view.addSubview(binTableView)
    }
    
    private func setupConstraints() {
        binTableView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}

extension BinViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.dishesSelectionModels.dishes.count ?? .zero
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: BinTableViewCell.reuseIdentifier, for: indexPath) as? BinTableViewCell,
              let viewModel else { return UITableViewCell() }
        
        let dish = viewModel.dishesSelectionModels.dishes[indexPath.row]
        let image = viewModel.dishesSelectionModels.images[indexPath.row]
        
        cell.configure(with: dish, image: image)
        
        return cell
    }
}

extension BinViewController: ViewModelSetterProtocol {
    func set(_ viewModel: BinViewModel) {
        self.viewModel = viewModel
    }
}
