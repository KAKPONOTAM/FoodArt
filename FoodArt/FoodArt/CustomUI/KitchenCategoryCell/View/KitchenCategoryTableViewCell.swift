import UIKit
import SnapKit

final class KitchenCategoryCollectionViewCell: UICollectionViewCell {
    private let kitchenCategoryLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.textColor = .black
        label.numberOfLines = .zero
        label.font = UIFont(font: .displayRegular, fontSize: KitchenCategoryCellConstants.kitchenCategoryLabelFontSize)
        
        return label
    }()
    
    private let kitchenCategoryImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = KitchenCategoryCellConstants.kitchenCategoryImageViewCornerRadius
        
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        return nil
    }
    
    func configure(with category: FoodCategory, image: UIImage?) {
        kitchenCategoryImageView.image = image
        kitchenCategoryLabel.text = category.name
    }
}

extension KitchenCategoryCollectionViewCell {
    private func addSubview() {
        contentView.addSubview(kitchenCategoryLabel)
        contentView.addSubview(kitchenCategoryImageView)
        
        contentView.bringSubviewToFront(kitchenCategoryLabel)
    }
    
    private func setupConstraints() {
        
        kitchenCategoryImageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        kitchenCategoryLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(KitchenCategoryCellConstants.kitchenCategoryLabelTopInset)
            $0.leading.equalToSuperview().inset(KitchenCategoryCellConstants.kitchenCategoryLabelSideInset)
            $0.width.equalTo(KitchenCategoryCellConstants.kitchenCategoryLabelWidth)
        }
    }
}
