import UIKit
import SnapKit

final class DishesCategoryViewController: UIViewController {
    private var viewModel: DishesCategoryViewModel?
    
    private lazy var dishesCategoryCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        
        return collectionView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension DishesCategoryViewController {
    private func addSubview() {
        view.addSubview(dishesCategoryCollectionView)
    }
    
    private func setupConstraints() {
        dishesCategoryCollectionView.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.top.bottom.equalToSuperview()
        }
    }
}

extension DishesCategoryViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel?.dishesCategoryDownloadedInfo.downloadedInfo.dishes.count ?? .zero
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width / 3, height: 130)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
}

extension DishesCategoryViewController: ViewModelSetterProtocol {
    func set(_ viewModel: DishesCategoryViewModel) {
        self.viewModel = viewModel
    }
}
