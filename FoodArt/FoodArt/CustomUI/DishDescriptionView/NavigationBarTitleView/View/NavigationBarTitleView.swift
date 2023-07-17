import UIKit
import SnapKit
import CoreLocation

final class NavigationBarTitleView: UIView {
    private let locationImageView: UIImageView = {
        let imageView = UIImageView(.locationImage)
        
        return imageView
    }()
    
    private let avatarImageView: UIImageView = {
        let imageView = UIImageView(.navigationBarTitleImage)
        
        return imageView
    }()
    
    private let cityNameLabel: TopPaddingLabel = {
        let label = TopPaddingLabel()
        label.textColor = .black
        label.text = "Санкт-Петербург"
        label.font = UIFont(font: .displayRegular, fontSize: NavigationBarTitleViewConstants.cityNameLabelFontSize)
        
        return label
    }()
    
    private let dateLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(.customLightGray)
        label.text = DateFormatterManager.string(from: Date(), to: .d_MMMM_yyyy)
        label.font = UIFont(font: .displayRegular, fontSize: NavigationBarTitleViewConstants.dateLabelFontSize)
        
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
}

extension NavigationBarTitleView {
    func setCityName(_ cityName: String?) {
        cityNameLabel.text = cityName
    }
}

extension NavigationBarTitleView {
    private func addSubview() {
        addSubview(locationImageView)
        addSubview(avatarImageView)
        addSubview(cityNameLabel)
        addSubview(dateLabel)
    }
    
    private func setupConstraints() {
        locationImageView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(NavigationBarTitleViewConstants.locationImageViewTopInset)
            $0.leading.equalToSuperview().inset(NavigationBarTitleViewConstants.locationImageViewSideInset)
        }
        
        cityNameLabel.snp.makeConstraints {
            $0.top.equalTo(locationImageView).offset(NavigationBarTitleViewConstants.cityNameLabelTopOffset)
            $0.leading.equalTo(locationImageView.snp.trailing).offset(NavigationBarTitleViewConstants.cityNameLabelLeadingOffset)
            $0.height.equalTo(locationImageView)
        }
        
        dateLabel.snp.makeConstraints {
            $0.top.equalTo(cityNameLabel.snp.bottom).offset(NavigationBarTitleViewConstants.dateLabelTopOffset)
            $0.leading.trailing.equalTo(cityNameLabel)
        }
        
        avatarImageView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(NavigationBarTitleViewConstants.avatarImageViewTopInset)
            $0.trailing.equalToSuperview().inset(NavigationBarTitleViewConstants.avatarImageViewTrailingInset)
        }
    }
}
