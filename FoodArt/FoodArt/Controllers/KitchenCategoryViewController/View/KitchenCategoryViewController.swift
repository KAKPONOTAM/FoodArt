import UIKit
import SnapKit

final class KitchenCategoryViewController: UIViewController {
    private var viewModel: KitchenCategoryViewModel?
    
    private lazy var kitchenCategoryCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(KitchenCategoryCollectionViewCell.self, forCellWithReuseIdentifier: KitchenCategoryCollectionViewCell.reuseIdentifier)
        
        return collectionView
    }()
    
    private let navigationBarTitleView: NavigationBarTitleView = {
        let view = NavigationBarTitleView()
        view.backgroundColor = .white
        
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubview()
        setupConstraints()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tabBarController?.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        tabBarController?.navigationController?.setNavigationBarHidden(false, animated: true)
    }
}

extension KitchenCategoryViewController {
    private func addSubview() {
        view.addSubview(kitchenCategoryCollectionView)
        view.addSubview(navigationBarTitleView)
    }
    
    private func setupConstraints() {
        kitchenCategoryCollectionView.snp.makeConstraints {
            $0.top.equalTo(navigationBarTitleView.snp.bottom).offset(KitchenCategoryViewConstants.kitchenCategoryCollectionViewTopInset)
            $0.bottom.equalToSuperview()
            $0.leading.trailing.equalToSuperview().inset(KitchenCategoryViewConstants.kitchenCategoryCollectionViewSideInset)
        }
        
        navigationBarTitleView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(KitchenCategoryViewConstants.heightForNavigationBarTitleView)
        }
    }
}

extension KitchenCategoryViewController: ViewModelSetterProtocol {
    func set(_ viewModel: KitchenCategoryViewModel) {
        self.viewModel = viewModel
    }
}

extension KitchenCategoryViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
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
        
        return CGSize(width: collectionView.frame.width, height: KitchenCategoryViewConstants.heightForItem)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        viewModel?.pushDishesViewController(index: indexPath.item)
    }
}
