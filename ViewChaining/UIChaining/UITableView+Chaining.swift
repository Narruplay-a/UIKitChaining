import UIKit

extension UITableView: UITableViewChaining { }
public protocol UITableViewChaining { }
public extension UITableViewChaining {
    @discardableResult
    func register(_ nib: UINib, id: String) -> Self {
        (self as! UITableView).register(nib, forCellReuseIdentifier: id)
        return self
    }
    @discardableResult
    func register(_ className: AnyClass, id: String) -> Self {
        (self as! UITableView).register(className, forCellReuseIdentifier: id)
        return self
    }
    @discardableResult
    func separatorStyle(_ separatorStyle: UITableViewCell.SeparatorStyle) -> Self {
        (self as! UITableView).separatorStyle = separatorStyle
        return self
    }
    @discardableResult
    func separatorColor(_ separatorColor: UIColor) -> Self {
        (self as! UITableView).separatorColor = separatorColor
        return self
    }
    @discardableResult
    func tableHeaderView(_ tableHeaderView: UIView) -> Self {
        (self as! UITableView).tableHeaderView = tableHeaderView
        return self
    }
    @discardableResult
    func tableFooterView(_ tableFooterView: UIView) -> Self {
        (self as! UITableView).tableFooterView = tableFooterView
        return self
    }
    @discardableResult
    func estimatedRowHeight(_ estimatedRowHeight: CGFloat) -> Self {
        (self as! UITableView).estimatedRowHeight = estimatedRowHeight
        return self
    }
    @discardableResult
    func allowsSelection(_ allowsSelection: Bool) -> Self {
        (self as! UITableView).allowsSelection = allowsSelection
        return self
    }
    @discardableResult
    func delegate(_ delegate: UITableViewDelegate) -> Self {
        (self as! UITableView).delegate = delegate
        return self
    }
    @discardableResult
    func dataSource(_ dataSource: UITableViewDataSource) -> Self {
        (self as! UITableView).dataSource = dataSource
        return self
    }
    @discardableResult
    func enableCallbacks(_ enableCallbacks: Bool) -> Self {
        (self as! UITableView).enableCallbacks = enableCallbacks
        return self
    }
    @discardableResult
    func emptyView(_ emptyView: UIView) -> Self {
        (self as! UITableView).emptyView = emptyView
        return self
    }
}
