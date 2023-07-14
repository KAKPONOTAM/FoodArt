import UIKit
import SnapKit

final class DishesCategoryCollectionViewCell: UICollectionViewCell {
    private let containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray6
        view.layer.cornerRadius = 10
        view.clipsToBounds = true
        
        return view
    }()
    
    private let dishesImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        
        return imageView
    }()
    
    private let dishesNameLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.textColor = .black
        label.numberOfLines = .zero
        label.backgroundColor = .clear
        label.font = UIFont(font: .displayRegular, fontSize: 14)
        
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        return nil
    }
    
    func configure(with dish: Dish, image: UIImage?) {
        dishesImageView.image = image
        dishesNameLabel.text = dish.name
    }
}

extension DishesCategoryCollectionViewCell {
    private func addSubview() {
        contentView.addSubview(containerView)
        contentView.addSubview(dishesNameLabel)
        
        containerView.addSubview(dishesImageView)
    }
    
    private func setupConstraints() {
        containerView.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
            $0.height.equalTo(110)
        }
        
        dishesImageView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(12)
            $0.leading.trailing.equalToSuperview().inset(8)
            $0.bottom.equalToSuperview()
        }
        
        dishesNameLabel.snp.makeConstraints {
            $0.top.equalTo(dishesImageView.snp.bottom).offset(5)
            $0.leading.trailing.equalToSuperview()
        }
    }
}
