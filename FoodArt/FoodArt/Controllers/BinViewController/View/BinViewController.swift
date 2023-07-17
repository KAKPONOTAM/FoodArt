import UIKit
import SnapKit

final class BinViewController: UIViewController {
    private var viewModel: BinViewModel?
    
    private let navigationBarTitleView: NavigationBarTitleView = {
        let view = NavigationBarTitleView()
        view.backgroundColor = .white
        
        return view
    }()
    
    private lazy var payButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(.customBlue)
        button.layer.cornerRadius = BinViewConstants.payButtonCornerRadius
        
        return button
    }()
    
    private lazy var binTableView: UITableView = {
        let tableView = UITableView()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.separatorStyle = .none
        tableView.register(BinTableViewCell.self, forCellReuseIdentifier: BinTableViewCell.reuseIdentifier)
        
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubview()
        setupConstraints()
        bind()
    }
}

extension BinViewController {
    private func bind() {
        guard let viewModel else { return }
        
        viewModel.tableViewUpdates.bind { [unowned self] tableViewUpdates in
            guard let tableViewUpdates else { return }
            
            switch tableViewUpdates {
            case .deleteRows(let indexPaths, let animation):
                binTableView.beginUpdates()
                binTableView.deleteRows(at: indexPaths, with: animation)
                binTableView.endUpdates()
                
            case .reloadRows(let indexPaths, let animation):
                binTableView.beginUpdates()
                binTableView.reloadRows(at: indexPaths, with: animation)
                binTableView.endUpdates()
                
            case .reload:
                return binTableView.reloadData()
            }
        }
        
        viewModel.savedDishModels.bind { [unowned self] savedDishModels in
            let price = savedDishModels.map { $0.price }.reduce(.zero, { $0 + $1 })
            payButton.setTitle("\(ModuleTitles.pay.title ?? .emptyString) \(price) ₽", for: .normal)
        }
    }
    
    private func addSubview() {
        view.addSubview(binTableView)
        view.addSubview(navigationBarTitleView)
        view.addSubview(payButton)
    }
    
    private func setupConstraints() {
        binTableView.snp.makeConstraints {
            $0.top.equalTo(navigationBarTitleView.snp.bottom).offset(BinViewConstants.binTableViewTopOffset)
            $0.bottom.equalToSuperview()
            $0.leading.trailing.equalToSuperview()
        }
        
        navigationBarTitleView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(BinViewConstants.heightForNavigationBarTitleView)
        }
        
        payButton.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(BinViewConstants.payButtonSideInset)
            $0.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-BinViewConstants.payButtonSideInset)
            $0.height.equalTo(BinViewConstants.heightForPayButton)
        }
    }
}

extension BinViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.savedDishModels.value.count ?? .zero
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: BinTableViewCell.reuseIdentifier, for: indexPath) as? BinTableViewCell,
              let viewModel else { return UITableViewCell() }
        
        let savedDishModel = viewModel.savedDishModels.value[indexPath.row]
        let containedValueAmount = viewModel.containedValueAmount(model: savedDishModel)

        cell.configure(with: savedDishModel, containedValueAmount: containedValueAmount)
        cell.delegate = self
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return BinViewConstants.defaultHeightForRow
    }
}

extension BinViewController: ViewModelSetterProtocol {
    func set(_ viewModel: BinViewModel) {
        self.viewModel = viewModel
    }
}

extension BinViewController: BinTableViewCellDelegate {
    func recountSavedDishes(with amount: Int, savedDishModel: SavedDishModel) {
        viewModel?.recountSavedDishes(with: amount, savedDishModel: savedDishModel)
    }
}
