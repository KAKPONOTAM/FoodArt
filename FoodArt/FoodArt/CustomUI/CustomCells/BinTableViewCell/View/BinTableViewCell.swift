import UIKit
import SnapKit

final class BinTableViewCell: UITableViewCell {
    private let selectedDishesImageView: UIImageView = {
        let imageView = UIImageView()
        
        return imageView
    }()
    
    private let dishesNameLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.textColor = .black
        label.font = UIFont(font: .displayRegular, fontSize: 14)
        
        return label
    }()
    
    private let dishesParametersLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .left
        label.font = UIFont(font: .displayRegular, fontSize: 14)
        
        return label
    }()
    
    private let dishesCounter: UIStepper = {
        let counter = UIStepper()
        return counter
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        return nil
    }
    
    func configure(with dish: Dish, image: UIImage?) {
        selectedDishesImageView.image = image
        
        dishesNameLabel.text = dish.name
        dishesParametersLabel.text = "\(dish.price) · \(dish.weight)"
    }
}

extension BinTableViewCell {
    private func addSubview() {
        contentView.addSubview(selectedDishesImageView)
        contentView.addSubview(dishesNameLabel)
        contentView.addSubview(dishesParametersLabel)
        contentView.addSubview(dishesCounter)
    }
    
    private func setupConstraints() {
        dishesNameLabel.setContentHuggingPriority(.defaultHigh, for: .vertical)
        dishesParametersLabel.setContentHuggingPriority(.defaultHigh, for: .vertical)
        
        selectedDishesImageView.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(16)
            $0.top.bottom.equalToSuperview()
            $0.width.equalTo(selectedDishesImageView.snp.height)
        }
        
        dishesNameLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(15)
            $0.leading.equalTo(selectedDishesImageView.snp.trailing).offset(8)
        }
        
        dishesParametersLabel.snp.makeConstraints {
            $0.top.equalTo(dishesNameLabel.snp.bottom).offset(4)
            $0.leading.equalTo(dishesNameLabel)
        }
    }
}
