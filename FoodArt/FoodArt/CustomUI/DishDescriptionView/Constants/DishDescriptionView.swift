import UIKit
import SnapKit

protocol DishDescriptionViewDelegate: AnyObject {
    func dismissButtonTapped()
}

final class DishDescriptionView: UIView {
    private weak var delegate: DishDescriptionViewDelegate?
    
    private let dishImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.layer.cornerRadius = 10
        imageView.isUserInteractionEnabled = true
        imageView.backgroundColor = UIColor(.lightBackgroundColor)
        
        return imageView
    }()
    
    private lazy var dismissButton: UIButton = {
        let button = UIButton()
        button.setImage(ModuleImages.dismissImage.icon, for: .normal)
        button.layer.cornerRadius = 8
        button.addTarget(self, action: #selector(dismissButtonTapped), for: .touchUpInside)
        button.backgroundColor = .white
        
        return button
    }()
    
    private let addToFavoriteButton: UIButton = {
        let button = UIButton()
        button.setImage(ModuleImages.heartImage.icon, for: .normal)
        button.layer.cornerRadius = 8
        button.backgroundColor = .white
        
        return button
    }()
    
    private let addDishButton: UIButton = {
        let button = UIButton()
        button.setTitle("Добавить в корзину", for: .normal)
        button.titleLabel?.font = UIFont(font: .displayRegular, fontSize: 16)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = UIColor(.customBlue)
        button.layer.cornerRadius = 10
        
        return button
    }()
    
    private let dishNameLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.textColor = .black
        label.font = UIFont(font: .displayRegular, fontSize: 16)
        
        return label
    }()
    
    private let dishParameterLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.textColor = .black
        label.font = UIFont(font: .displayRegular, fontSize: 16)
        
        return label
    }()
    
    private let dishDescriptionTextView: UITextView = {
        let textView = UITextView()
        textView.font = UIFont(font: .displayRegular, fontSize: 14)
        textView.textColor = UIColor(.customLightGray)
        textView.isEditable = false
        textView.showsVerticalScrollIndicator = false
        
        return textView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        return nil
    }
    
    @objc
    private func dismissButtonTapped() {
        delegate?.dismissButtonTapped()
    }
}

extension DishDescriptionView {
    func setDish(_ dish: Dish) {
        dishNameLabel.text = dish.name
        dishParameterLabel.text = "\(dish.price) \(dish.weight)"
        dishDescriptionTextView.text = dish.description
    }
    
    func setDishImage(_ image: UIImage?) {
        dishImageView.image = image
    }
    
    func setDelegate(_ delegate: DishDescriptionViewDelegate?) {
        self.delegate = delegate
    }
}

extension DishDescriptionView {
    private func addSubview() {
        addSubview(dishImageView)
        addSubview(dishNameLabel)
        addSubview(dishParameterLabel)
        addSubview(dishDescriptionTextView)
        addSubview(addDishButton)
        
        dishImageView.addSubview(addToFavoriteButton)
        dishImageView.addSubview(dismissButton)
    }
    
    private func setupConstraints() {
        dishImageView.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview().inset(16)
            $0.height.equalToSuperview().multipliedBy(0.5)
        }
        
        dishNameLabel.snp.makeConstraints {
            $0.top.equalTo(dishImageView.snp.bottom).offset(8)
            $0.leading.trailing.equalTo(dishImageView)
            $0.height.equalTo(15)
        }
        
        dishParameterLabel.snp.makeConstraints {
            $0.top.equalTo(dishNameLabel.snp.bottom).offset(8)
            $0.leading.trailing.equalTo(dishNameLabel)
            $0.height.equalTo(15)
        }
        
        dishDescriptionTextView.snp.makeConstraints {
            $0.top.equalTo(dishParameterLabel.snp.bottom).offset(8)
            $0.leading.trailing.equalToSuperview().inset(10)
            $0.bottom.equalTo(addDishButton.snp.top).offset(-16)
        }
        
        addDishButton.snp.makeConstraints {
            $0.leading.trailing.bottom.equalToSuperview().inset(16)
            $0.height.equalTo(48)
        }
        
        dismissButton.snp.makeConstraints {
            $0.top.trailing.equalToSuperview().inset(8)
            $0.width.height.equalTo(40)
        }
        
        addToFavoriteButton.snp.makeConstraints {
            $0.trailing.equalTo(dismissButton.snp.leading).offset(-8)
            $0.top.equalTo(dismissButton)
            $0.width.height.equalTo(40)
        }
    }
}
