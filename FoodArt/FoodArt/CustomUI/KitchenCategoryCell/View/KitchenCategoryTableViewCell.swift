import UIKit
import SnapKit

final class KitchenCategoryCollectionViewCell: UICollectionViewCell {
    private let kitchenCategoryLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.textColor = .black
        label.numberOfLines = .zero
        label.font = UIFont(font: .displayRegular, fontSize: 20)
        
        return label
    }()
    
    private let kitchenCategoryImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 10
        
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
}

extension KitchenCategoryCollectionViewCell {
    private func addSubview() {
        contentView.addSubview(kitchenCategoryLabel)
        contentView.addSubview(kitchenCategoryImageView)
        
        kitchenCategoryLabel.bringSubviewToFront(kitchenCategoryLabel)
    }
    
    private func setupConstraints() {
        kitchenCategoryImageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        kitchenCategoryLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(12)
            $0.leading.equalToSuperview().inset(16)
        }
    }
}
