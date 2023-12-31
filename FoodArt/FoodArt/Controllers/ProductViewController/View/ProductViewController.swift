import UIKit
import SnapKit

final class ProductViewController: UIViewController {
    private var viewModel: ProductViewModel?
    
    private lazy var dishDescriptionView: DishDescriptionView = {
        let view = DishDescriptionView()
        view.backgroundColor = .white
        view.layer.cornerRadius = ProductViewConstants.dishDescriptionViewCornerRadius
        view.setDelegate(self)
        
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        addSubview()
        setupConstraints()
        bind()
        
        view.backgroundColor = .black.withAlphaComponent(0.5)
    }
}

extension ProductViewController {
    private func addSubview() {
        view.addSubview(dishDescriptionView)
    }
    
    private func setupConstraints() {
        dishDescriptionView.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.height.equalToSuperview().dividedBy(1.82)
            $0.leading.trailing.equalToSuperview().inset(ProductViewConstants.dishDescriptionViewSideInset)
        }
    }
    
    private func bind() {
        guard let viewModel else { return }
        
        viewModel.dish.bind { [unowned self] dish in
            guard let dish else { return }
            
            dishDescriptionView.setDish(dish)
        }
        
        viewModel.dishImage.bind { [unowned self] in
            dishDescriptionView.setDishImage($0)
        }
    }
}

extension ProductViewController: ViewModelSetterProtocol {
    func set(_ viewModel: ProductViewModel) {
        self.viewModel = viewModel
    }
}

extension ProductViewController: DishDescriptionViewDelegate {
    func addDishButtonTapped() {
        viewModel?.addDishButtonTapped()
    }
    
    func dismissButtonTapped() {
        viewModel?.dismissButtonTapped()
    }
}
