import UIKit
import SnapKit

final class FoodCategoryCollectionViewCell: UICollectionViewCell {
    private let foodCategoryLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .center
        label.font = UIFont(font: .displayRegular, fontSize: 14)
        
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview()
        setupConstraints()
        
        contentView.backgroundColor = UIColor(.lightBackgroundColor)
        contentView.layer.cornerRadius = 10
    }
    
    required init?(coder: NSCoder) {
        return nil
    }
    
    func configure(with foodCategoryTitle: String?) {
        foodCategoryLabel.text = foodCategoryTitle
    }
    
    func configureSelectedCell() {
        contentView.backgroundColor = UIColor(.customBlue)
        foodCategoryLabel.textColor = .white
    }
    
    func configureDeselectedCell() {
        contentView.backgroundColor = UIColor(.lightBackgroundColor)
        foodCategoryLabel.textColor = .black
    }
}


extension FoodCategoryCollectionViewCell {
    private func addSubview() {
        contentView.addSubview(foodCategoryLabel)
    }
    
    private func setupConstraints() {
        foodCategoryLabel.snp.makeConstraints {
            $0.top.bottom.equalToSuperview().inset(10)
            $0.leading.trailing.equalToSuperview().inset(16)
        }
    }
}
