import UIKit
import SnapKit

final class DishesCategoryViewController: UIViewController {
    private var viewModel: DishesCategoryViewModel?
    
    private lazy var dishesCategoryCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = DishCategoryViewConstants.dishesCategoryCollectionViewMinimumLineSpacing
        layout.minimumInteritemSpacing = DishCategoryViewConstants.dishesCategoryCollectionViewMinimumInteritemSpacing
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = .white
        collectionView.register(DishesCategoryCollectionViewCell.self, forCellWithReuseIdentifier: DishesCategoryCollectionViewCell.reuseIdentifier)
        
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubview()
        setupConstraints()
        configureNavigationBar()
        bind()
        
        view.backgroundColor = .white
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tabBarController?.navigationController?.setNavigationBarHidden(false, animated: false)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        tabBarController?.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    @objc
    private func backButtonTapped() {
        viewModel?.backButtonTapped()
    }
}

extension DishesCategoryViewController {
    private func bind() {
        guard let viewModel else { return }
        
        viewModel.selectedKitchenCategoryTitle.bind { [unowned self] selectedKitchenCategoryTitle in
            guard let selectedKitchenCategoryTitle,
                  !selectedKitchenCategoryTitle.isEmpty else { return }
            
            tabBarController?.navigationItem.title = selectedKitchenCategoryTitle
        }
    }
    
    private func configureNavigationBar() {
        let leftBarButton = UIBarButtonItem(image: ModuleImages.leftBarButtonIcon.icon, style: .done, target: self, action: #selector(backButtonTapped))
        let rightBarButton = UIBarButtonItem(customView: UIImageView(.navigationBarTitleImage))
        
        tabBarController?.navigationItem.leftBarButtonItem = leftBarButton
        tabBarController?.navigationItem.rightBarButtonItem = rightBarButton
    }
    
    private func addSubview() {
        view.addSubview(dishesCategoryCollectionView)
    }
    
    private func setupConstraints() {
        dishesCategoryCollectionView.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(DishCategoryViewConstants.dishesCategoryCollectionViewSideInset)
            $0.bottom.equalToSuperview()
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(DishCategoryViewConstants.dishesCategoryCollectionViewTopOffset)
        }
    }
}

extension DishesCategoryViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel?.dishesCategoryDownloadedInfo.downloadedInfo.dishes.count ?? .zero
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DishesCategoryCollectionViewCell.reuseIdentifier, for: indexPath) as? DishesCategoryCollectionViewCell,
              let viewModel else { return UICollectionViewCell() }
        
        let dish = viewModel.dishesCategoryDownloadedInfo.downloadedInfo.dishes[indexPath.item]
        let image = viewModel.dishesCategoryDownloadedInfo.images[indexPath.item]
        
        cell.configure(with: dish, image: image)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (collectionView.frame.width / 3) - 8, height: DishCategoryViewConstants.heightForItem)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        viewModel?.presentProductViewController(index: indexPath.item)
    }
}

extension DishesCategoryViewController: ViewModelSetterProtocol {
    func set(_ viewModel: DishesCategoryViewModel) {
        self.viewModel = viewModel
    }
}
