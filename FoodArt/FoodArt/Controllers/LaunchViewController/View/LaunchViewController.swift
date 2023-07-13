import UIKit
import SnapKit

final class LaunchViewController: UIViewController {
    private var viewModel: LaunchViewModel?
    
    private let launchImageView: UIImageView = {
        let imageView = UIImageView(.launchImage)
        imageView.tintColor = .white
        imageView.contentMode = .scaleAspectFit
        
        return imageView
    }()
    
    private let activityIndicator: UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView(style: .large)
        indicator.color = .white
        indicator.startAnimating()
        
        return indicator
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        addSubview()
        setupConstraints()
        viewModel?.downloadInfo()
        
        view.backgroundColor = .black
    }
}

extension LaunchViewController {
    private func addSubview() {
        view.addSubview(launchImageView)
        view.addSubview(activityIndicator)
        
        view.bringSubviewToFront(activityIndicator)
    }
    
    private func setupConstraints() {
        launchImageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        activityIndicator.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}

extension LaunchViewController: ViewModelSetterProtocol {
    func set(_ viewModel: LaunchViewModel) {
        self.viewModel = viewModel
    }
}
