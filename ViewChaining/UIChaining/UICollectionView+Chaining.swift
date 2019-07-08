import UIKit

extension UICollectionView: UICollectionViewChaining { }
public protocol UICollectionViewChaining { }
public extension UICollectionViewChaining {
    @discardableResult
    func register(_ className: AnyClass, id: String) -> Self {
        (self as! UICollectionView).register(className, forCellWithReuseIdentifier: id)
        return self
    }
    @discardableResult
    func register(_ nib: UINib, id: String) -> Self {
        (self as! UICollectionView).register(nib, forCellWithReuseIdentifier: id)
        return self
    }
    @discardableResult
    func collectionViewLayout(_ collectionViewLayout: UICollectionViewLayout) -> Self {
        (self as! UICollectionView).collectionViewLayout = collectionViewLayout
        return self
    }
    @discardableResult
    func allowsSelection(_ allowsSelection: Bool) -> Self {
        (self as! UICollectionView).allowsSelection = allowsSelection
        return self
    }
    @discardableResult
    func delegate(_ delegate: UICollectionViewDelegate) -> Self {
        (self as! UICollectionView).delegate = delegate
        return self
    }
    @discardableResult
    func dataSource(_ dataSource: UICollectionViewDataSource) -> Self {
        (self as! UICollectionView).dataSource = dataSource
        return self
    }
    @available (iOS 11.0, *)
    @discardableResult
    func dragDelegate(_ dragDelegate: UICollectionViewDragDelegate) -> Self {
        (self as! UICollectionView).dragDelegate = dragDelegate
        return self
    }
    @available (iOS 11.0, *)
    @discardableResult
    func dropDelegate(_ dropDelegate: UICollectionViewDropDelegate) -> Self {
        (self as! UICollectionView).dropDelegate = dropDelegate
        return self
    }
}
