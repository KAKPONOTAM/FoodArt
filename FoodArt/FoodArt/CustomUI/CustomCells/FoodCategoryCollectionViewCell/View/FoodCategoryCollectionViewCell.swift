import UIKit
import SnapKit

final class FoodCategoryCollectionViewCell: UICollectionViewCell {
    private let foodCategoryLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .center
        label.font = UIFont(font: .displayRegular, fontSize: FoodCategoryCellConstants.foodCategoryLabelFontSize)
        
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview()
        setupConstraints()
        configureContentView()
    }
    
    required init?(coder: NSCoder) {
        return nil
    }
    
    override var isSelected: Bool {
        didSet {
            isSelected ? configureSelectedCell() : configureDeselectedCell()
        }
    }
    
    func configure(with foodCategoryTitle: String?) {
        foodCategoryLabel.text = foodCategoryTitle
    }
}

extension FoodCategoryCollectionViewCell {
    private func addSubview() {
        contentView.addSubview(foodCategoryLabel)
    }
    
    private func setupConstraints() {
        foodCategoryLabel.snp.makeConstraints {
            $0.top.bottom.equalToSuperview().inset(FoodCategoryCellConstants.foodCategoryLabelTopBottomInset)
            $0.leading.trailing.equalToSuperview().inset(FoodCategoryCellConstants.foodCategoryLabelSideInset)
        }
    }
    
    private func configureContentView() {
        contentView.backgroundColor = UIColor(.lightBackgroundColor)
        contentView.layer.cornerRadius = FoodCategoryCellConstants.contentViewCornerRadius
    }
    
    private func configureSelectedCell() {
        contentView.backgroundColor = UIColor(.customBlue)
        foodCategoryLabel.textColor = .white
    }
    
    private func configureDeselectedCell() {
        contentView.backgroundColor = UIColor(.lightBackgroundColor)
        foodCategoryLabel.textColor = .black
    }
}
