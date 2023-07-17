import UIKit
import SnapKit

protocol CustomStepperDelegate: AnyObject {
    func valueChanged(_ value: Int)
}

final class CustomStepper: UIView {
    weak var delegate: CustomStepperDelegate?
    
    var currentValue = 1 {
        didSet {
            currentValue = currentValue > .zero ? currentValue : .zero
            currentStepValueLabel.text = "\(currentValue)"
        }
    }
    
    private lazy var decreaseButton: UIButton = {
        let button = UIButton()
        button.setTitleColor(.black, for: .normal)
        button.setImage(ModuleImages.decreaseIcon.icon, for: .normal)
        button.addTarget(self, action: #selector(calculationAction), for: .touchUpInside)
        return button
    }()
    
    private lazy var increaseButton: UIButton = {
        let button = UIButton()
        button.setImage(ModuleImages.plusIcon.icon, for: .normal)
        button.addTarget(self, action: #selector(calculationAction), for: .touchUpInside)
        button.setTitleColor(.black, for: .normal)
        return button
    }()
    
    private lazy var currentStepValueLabel: UILabel = {
        var label = UILabel()
        label.textColor = .black
        label.text = "\(currentValue)"
        label.font = UIFont(font: .displayRegular, fontSize: CustomStepperConstants.currentStepValueLabelFontSize)
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
    
    @objc
    private func calculationAction(_ sender: UIButton) {
        switch sender {
        case decreaseButton:
            currentValue -= 1
            
        case increaseButton:
            currentValue += 1
            
        default:
            break
        }
        
        delegate?.valueChanged(currentValue)
    }
}

extension CustomStepper {
    private func addSubview() {
        addSubview(decreaseButton)
        addSubview(increaseButton)
        addSubview(currentStepValueLabel)
    }
    
    private func setupConstraints() {
        decreaseButton.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(CustomStepperConstants.defaultSideInset)
            $0.top.bottom.equalToSuperview().inset(CustomStepperConstants.defaultTopBottomInset)
        }
        
        increaseButton.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(CustomStepperConstants.defaultSideInset)
            $0.top.bottom.equalToSuperview().inset(CustomStepperConstants.defaultTopBottomInset)
        }
        
        currentStepValueLabel.snp.makeConstraints {
            $0.centerX.centerY.equalToSuperview()
        }
    }
}
