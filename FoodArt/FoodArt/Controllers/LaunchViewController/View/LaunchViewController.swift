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

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        
        addSubview()
        setupConstraints()
    }
}

extension LaunchViewController {
    private func addSubview() {
        view.addSubview(launchImageView)
    }
    
    private func setupConstraints() {
        launchImageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}

extension LaunchViewController: ViewModelSetterProtocol {
    func set(_ viewModel: LaunchViewModel) {
        self.viewModel = viewModel
    }
}
