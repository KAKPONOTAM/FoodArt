import UIKit
import SnapKit

protocol DishDescriptionViewDelegate: AnyObject {
    func dismissButtonTapped()
    func addDishButtonTapped()
}

final class DishDescriptionView: UIView {
    private weak var delegate: DishDescriptionViewDelegate?
    
    private let dishImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.layer.cornerRadius = DishDescriptionViewConstants.dishImageViewCornerRadius
        imageView.isUserInteractionEnabled = true
        imageView.backgroundColor = UIColor(.lightBackgroundColor)
        
        return imageView
    }()
    
    private lazy var dismissButton: UIButton = {
        let button = UIButton()
        button.setImage(ModuleImages.dismissImage.icon, for: .normal)
        button.layer.cornerRadius = DishDescriptionViewConstants.defaultCornerRadius
        button.addTarget(self, action: #selector(dismissButtonTapped), for: .touchUpInside)
        button.backgroundColor = .white
        
        return button
    }()
    
    private lazy var addToFavoriteButton: UIButton = {
        let button = UIButton()
        button.setImage(ModuleImages.heartImage.icon, for: .normal)
        button.layer.cornerRadius = DishDescriptionViewConstants.defaultCornerRadius
        button.backgroundColor = .white
        button.tintColor = .black
        button.addTarget(self, action: #selector(addToFavoriteButtonTapped), for: .touchUpInside)
        
        return button
    }()
    
    private lazy var addDishButton: UIButton = {
        let button = UIButton()
        button.setTitle(ModuleTitles.addDishTitle.title, for: .normal)
        button.titleLabel?.font = UIFont(font: .displayRegular, fontSize: DishDescriptionViewConstants.addDishButtonFontSize)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = UIColor(.customBlue)
        button.layer.cornerRadius = DishDescriptionViewConstants.addDishButtonCornerRadius
        button.addTarget(self, action: #selector(addDishButtonTapped), for: .touchUpInside)
        
        return button
    }()
    
    private let dishNameLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.textColor = .black
        label.font = UIFont(font: .displayRegular, fontSize: DishDescriptionViewConstants.defaultFontSize)
        
        return label
    }()
    
    private let dishParameterLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.textColor = .black
        label.font = UIFont(font: .displayRegular, fontSize: DishDescriptionViewConstants.defaultFontSize)
        
        return label
    }()
    
    private let dishDescriptionTextView: UITextView = {
        let textView = UITextView()
        textView.font = UIFont(font: .displayRegular, fontSize: DishDescriptionViewConstants.dishDescriptionTextViewFontSize)
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
    
    @objc
    private func addToFavoriteButtonTapped() {
        addToFavoriteButton.isSelected.toggle()
        addToFavoriteButton.tintColor = addToFavoriteButton.isSelected ? .red : .black
    }
    
    @objc
    private func addDishButtonTapped() {
        delegate?.addDishButtonTapped()
    }
}

extension DishDescriptionView {
    func setDish(_ dish: Dish) {
        dishNameLabel.text = dish.name
        dishParameterLabel.changeInNeedRangeColor(fullText: "\(dish.price)₽ · \(dish.weight)г", changeText: "· \(dish.weight)г")
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
            $0.top.leading.trailing.equalToSuperview().inset(DishDescriptionViewConstants.dishImageViewSideInset)
            $0.height.equalToSuperview().multipliedBy(0.5)
        }
        
        dishNameLabel.snp.makeConstraints {
            $0.top.equalTo(dishImageView.snp.bottom).offset(DishDescriptionViewConstants.defaultSideInset)
            $0.leading.trailing.equalTo(dishImageView)
            $0.height.equalTo(DishDescriptionViewConstants.defaultHeightForLabel)
        }
        
        dishParameterLabel.snp.makeConstraints {
            $0.top.equalTo(dishNameLabel.snp.bottom).offset(DishDescriptionViewConstants.defaultSideInset)
            $0.leading.trailing.equalTo(dishNameLabel)
            $0.height.equalTo(DishDescriptionViewConstants.defaultHeightForLabel)
        }
        
        dishDescriptionTextView.snp.makeConstraints {
            $0.top.equalTo(dishParameterLabel.snp.bottom).offset(DishDescriptionViewConstants.defaultSideInset)
            $0.leading.trailing.equalToSuperview().inset(DishDescriptionViewConstants.dishDescriptionTextViewSideInset)
            $0.bottom.equalTo(addDishButton.snp.top).offset(DishDescriptionViewConstants.dishDescriptionTextViewBottomOffset)
        }
        
        addDishButton.snp.makeConstraints {
            $0.leading.trailing.bottom.equalToSuperview().inset(DishDescriptionViewConstants.addDishButtonSideInset)
            $0.height.equalTo(DishDescriptionViewConstants.heightForAddDishButton)
        }
        
        dismissButton.snp.makeConstraints {
            $0.top.trailing.equalToSuperview().inset(DishDescriptionViewConstants.defaultSideInset)
            $0.width.height.equalTo(DishDescriptionViewConstants.defaultHeightForButton)
        }
        
        addToFavoriteButton.snp.makeConstraints {
            $0.trailing.equalTo(dismissButton.snp.leading).offset(-DishDescriptionViewConstants.defaultSideInset)
            $0.top.equalTo(dismissButton)
            $0.width.height.equalTo(DishDescriptionViewConstants.defaultHeightForButton)
        }
    }
}
