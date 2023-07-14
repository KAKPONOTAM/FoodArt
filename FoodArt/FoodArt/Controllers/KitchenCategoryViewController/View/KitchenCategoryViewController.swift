import UIKit
import SnapKit

final class KitchenCategoryViewController: UIViewController {
    private var viewModel: KitchenCategoryViewModel?
    
    private lazy var kitchenCategoryCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.backgroundColor = .white
        collectionView.register(KitchenCategoryCollectionViewCell.self, forCellWithReuseIdentifier: KitchenCategoryCollectionViewCell.reuseIdentifier)
        
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubview()
        setupConstraints()
        
        view.backgroundColor = .white
    }
}

extension KitchenCategoryViewController {
    private func addSubview() {
        view.addSubview(kitchenCategoryCollectionView)
    }
    
    private func setupConstraints() {
        kitchenCategoryCollectionView.snp.makeConstraints {
            $0.top.bottom.equalToSuperview()
            $0.leading.trailing.equalToSuperview().inset(16)
        }
    }
}

extension KitchenCategoryViewController: ViewModelSetterProtocol {
    func set(_ viewModel: KitchenCategoryViewModel) {
        self.viewModel = viewModel
    }
}

extension KitchenCategoryViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel?.kitchenCategoryDownloadedInfo.downloadedInfo.сategories.count ?? .zero
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: KitchenCategoryCollectionViewCell.reuseIdentifier, for: indexPath) as? KitchenCategoryCollectionViewCell,
              let viewModel else { return UICollectionViewCell() }
        
        let kitchenCategory = viewModel.kitchenCategoryDownloadedInfo.downloadedInfo.сategories[indexPath.row]
        let image = viewModel.kitchenCategoryDownloadedInfo.images[indexPath.row]
        
        cell.configure(with: kitchenCategory, image: image)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: collectionView.frame.width, height: 150)
    }
}
