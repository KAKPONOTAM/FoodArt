import UIKit
import SnapKit

protocol BinTableViewCellDelegate: AnyObject {
    func recountSavedDishes(with amount: Int, savedDishModel: SavedDishModel)
}

final class BinTableViewCell: UITableViewCell {
    private var savedDishModel: SavedDishModel?
    weak var delegate: BinTableViewCellDelegate?
    
    private lazy var customStepper: CustomStepper = {
        let stepper = CustomStepper()
        stepper.layer.cornerRadius = BinTableViewCellConstants.defaultCornerRadius
        stepper.backgroundColor = UIColor(.lightBackgroundColor)
        stepper.delegate = self
        
        return stepper
    }()
    
    private let selectedDishesImageViewContainer: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(.lightBackgroundColor)
        view.layer.cornerRadius = BinTableViewCellConstants.defaultCornerRadius
        
        return view
    }()
    
    private let selectedDishesImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        
        return imageView
    }()
    
    private let dishesNameLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.textColor = .black
        label.font = UIFont(font: .displayRegular, fontSize: BinTableViewCellConstants.defaultFontSize)
        
        return label
    }()
    
    private let dishesParametersLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .left
        label.font = UIFont(font: .displayRegular, fontSize: BinTableViewCellConstants.defaultFontSize)
        
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview()
        setupConstraints()
        
        selectionStyle = .none
    }
    
    required init?(coder: NSCoder) {
        return nil
    }
    
    func configure(with savedDishModel: SavedDishModel, containedValueAmount: Int) {
        self.savedDishModel = savedDishModel

        selectedDishesImageView.image = UIImage(data: savedDishModel.imageData)

        dishesNameLabel.text = savedDishModel.dishName
        dishesParametersLabel.changeInNeedRangeColor(fullText: "\(savedDishModel.price) ₽ · \(savedDishModel.weight)г", changeText: "· \(savedDishModel.weight)г")
        
        customStepper.currentValue = containedValueAmount
    }
}

extension BinTableViewCell {
    private func addSubview() {
        contentView.addSubview(dishesNameLabel)
        contentView.addSubview(dishesParametersLabel)
        contentView.addSubview(selectedDishesImageViewContainer)
        contentView.addSubview(customStepper)
        
        selectedDishesImageViewContainer.addSubview(selectedDishesImageView)
    }
    
    private func setupConstraints() {
        selectedDishesImageViewContainer.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(BinTableViewCellConstants.selectedDishesImageViewContainerSideInset)
            $0.top.bottom.equalToSuperview()
            $0.width.equalTo(selectedDishesImageViewContainer.snp.height)
        }
        
        selectedDishesImageView.snp.makeConstraints {
            $0.top.leading.trailing.bottom.equalToSuperview().inset(BinTableViewCellConstants.defaultSideOffset)
        }
        
        dishesNameLabel.snp.makeConstraints {
            $0.top.equalTo(selectedDishesImageView.snp.top).offset(BinTableViewCellConstants.defaultSideOffset)
            $0.leading.equalTo(selectedDishesImageViewContainer.snp.trailing).offset(BinTableViewCellConstants.dishesNameLabelSideOffset)
        }
        
        dishesParametersLabel.snp.makeConstraints {
            $0.top.equalTo(dishesNameLabel.snp.bottom).offset(BinTableViewCellConstants.dishesParametersLabelTopOffset)
            $0.leading.equalTo(dishesNameLabel)
        }
        
        customStepper.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(BinTableViewCellConstants.dishesCounterSideInset)
            $0.centerY.equalToSuperview()
            $0.width.equalTo(BinTableViewCellConstants.widthForCustomStepper)
        }
    }
}

extension BinTableViewCell: CustomStepperDelegate {
    func valueChanged(_ value: Int) {
        guard let savedDishModel else { return }
        delegate?.recountSavedDishes(with: value, savedDishModel: savedDishModel)
    }
}
