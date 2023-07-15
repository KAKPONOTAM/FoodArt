import UIKit
import SnapKit

final class BinViewController: UIViewController {
    private var viewModel: BinViewModel?
    
    private let navigationBarTitleView: NavigationBarTitleView = {
        let view = NavigationBarTitleView()
        view.backgroundColor = .white
        
        return view
    }()
    
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
        view.addSubview(navigationBarTitleView)
    }
    
    private func setupConstraints() {
        binTableView.snp.makeConstraints {
            $0.top.equalTo(navigationBarTitleView.snp.bottom).offset(15)
            $0.bottom.equalToSuperview()
            $0.leading.trailing.equalToSuperview()
        }
        
        navigationBarTitleView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(50)
        }
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
