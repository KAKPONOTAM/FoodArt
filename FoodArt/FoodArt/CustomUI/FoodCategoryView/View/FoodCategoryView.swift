import UIKit
import SnapKit

protocol FoodCategoryViewDelegate: AnyObject {
    func didSelect(_ tag: String)
}

final class FoodCategoryView: UIView {
    private var foodCategoryTags: [String] = .emptyCollection
    private weak var delegate: FoodCategoryViewDelegate?
    
    private lazy var foodCategoryCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.register(FoodCategoryCollectionViewCell.self, forCellWithReuseIdentifier: FoodCategoryCollectionViewCell.reuseIdentifier)
        
        return collectionView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        return nil
    }
    
    func set(_ foodCategoryTags: [String]) {
        self.foodCategoryTags = foodCategoryTags
        
        let indexPath = IndexPath(item: .zero, section: .zero)
        foodCategoryCollectionView.selectItem(at: indexPath, animated: true, scrollPosition: .bottom)
    }
    
    func setDelegate(_ delegate: FoodCategoryViewDelegate?) {
        self.delegate = delegate
    }
}

extension FoodCategoryView {
    private func addSubview() {
        addSubview(foodCategoryCollectionView)
    }
    
    private func setupConstraints() {
        foodCategoryCollectionView.snp.makeConstraints {
            $0.top.bottom.equalToSuperview()
            $0.leading.trailing.equalToSuperview().inset(FoodCategoryViewConstants.foodCategoryCollectionViewSideInset)
        }
    }
}

extension FoodCategoryView: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return foodCategoryTags.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FoodCategoryCollectionViewCell.reuseIdentifier, for: indexPath) as? FoodCategoryCollectionViewCell else { return UICollectionViewCell() }
        
        let foodCategoryTitle = foodCategoryTags[indexPath.item]
        cell.configure(with: foodCategoryTitle)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: FoodCategoryViewConstants.heightForItem, height: collectionView.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedTag = foodCategoryTags[indexPath.item]
        delegate?.didSelect(selectedTag)
    }
}
