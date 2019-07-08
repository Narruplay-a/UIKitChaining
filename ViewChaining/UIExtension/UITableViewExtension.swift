//
//  UITableViewExtension.swift
//  ViewChaining
//
//  Created by Adel Khaziakhmetov on 01.07.2019.
//  Copyright © 2019 Uznat Shtrafy.ru. All rights reserved.
//

import UIKit

fileprivate struct UITableViewExtensionCallbackCollection {
    var cellForRow: ((_ tableView: UITableView, _ indexPath: IndexPath) -> UITableViewCell)?
    var cellHeight: ((_ tableView: UITableView, _ indexPath: IndexPath) -> CGFloat)?
    var estimatedCellHeight: ((_ tableView: UITableView, _ indexPath: IndexPath) -> CGFloat)?
    var viewForHeader: ((_ tableView: UITableView, _ section: Int) -> UIView?)?
    var estimatedHeaderHeight: ((_ tableView: UITableView, _ section: Int) -> CGFloat)?
    var headerHeight: ((_ tableView: UITableView, _ section: Int) -> CGFloat)?
    var viewForFooter: ((_ tableView: UITableView, _ section: Int) -> UIView?)?
    var estimatedFooterHeight: ((_ tableView: UITableView, _ section: Int) -> CGFloat)?
    var footerHeight: ((_ tableView: UITableView, _ section: Int) -> CGFloat)?
    var numberOfRows: ((_ tableView: UITableView, _ section: Int) -> Int)?
    var numberOfSections: ((_ tableView: UITableView) -> Int)?
    var willDisplayCell: ((_ tableView: UITableView, _ cell: UITableViewCell, _ indexPath: IndexPath) -> Void)?
    var didEndDisplayCell: ((_ tableView: UITableView, _ cell: UITableViewCell, _ indexPath: IndexPath) -> Void)?
    var willDisplayHeader: ((_ tableView: UITableView, _ view: UIView, _ section: Int) -> Void)?
    var didEndDisplayHeader: ((_ tableView: UITableView, _ view: UIView, _ section: Int) -> Void)?
    var willDisplayFooter: ((_ tableView: UITableView, _ view: UIView, _ section: Int) -> Void)?
    var didEndDisplayFooter: ((_ tableView: UITableView, _ view: UIView, _ section: Int) -> Void)?
    var willSelectRow: ((_ tableView: UITableView, _ indexPath: IndexPath) -> IndexPath?)?
    var didSelectRow: ((_ tableView: UITableView, _ indexPath: IndexPath) -> Void?)?
    var willDeselectRow: ((_ tableView: UITableView, _ indexPath: IndexPath) -> IndexPath)?
    var didDeselectRow: ((_ tableView: UITableView, _ indexPath: IndexPath) -> Void)?
    var willBeginEditing: ((_ tableView: UITableView, _ indexPath: IndexPath) -> Void)?
    var didEndEditing: ((_ tableView: UITableView, _ indexPath: IndexPath?) -> Void)?
    var editingStyle: ((_ tableView: UITableView, _ indexPath: IndexPath) -> UITableViewCell.EditingStyle)?
    var titleForDeleteConfirmationButton: ((_ tableView: UITableView, _ indexPath: IndexPath) -> String)?
    var editActions: ((_ tableView: UITableView, _ indexPath: IndexPath) -> [UITableViewRowAction])?
    var shouldIndentWhileEditing: ((_ tableView: UITableView, _ indexPath: IndexPath) -> Bool)?
    var targetIndexPathForMove: ((_ tableView: UITableView, _ sourceIndexPath: IndexPath, _ proposedDestinationIndexPath: IndexPath) -> IndexPath)?
    var indentationLevel: ((_ tableView: UITableView, _ indexPath: IndexPath) -> Int)?
    var shouldShowMenu: ((_ tableView: UITableView, _ indexPath: IndexPath) -> Bool)?
    var canPerformAction: ((_ tableView: UITableView, _ selector: Selector, _ indexPath: IndexPath, _ sender: Any?) -> Bool)?
    var performAction: ((_ tableView: UITableView, _ selector: Selector, _ indexPath: IndexPath, _ sender: Any?) -> Void)?
    var canFocus: ((_ tableView: UITableView, _ indexPath: IndexPath) -> Bool)?
    var indexPathForPreferredFocusedView: ((_ tableView: UITableView) -> IndexPath?)?
    var accessoryButtonTapped: ((_ tableView: UITableView, _ indexPath: IndexPath) -> Void)?
    var shouldHighlight: ((_ tableView: UITableView, _ indexPath: IndexPath) -> Bool)?
    var didHighlight: ((_ tableView: UITableView, _ indexPath: IndexPath) -> Void)?
    var didUnhighlight: ((_ tableView: UITableView, _ indexPath: IndexPath) -> Void)?
}

public extension UITableView {
    private struct AssociatedKeys {
        static var callbackCollection: UITableViewExtensionCallbackCollection = UITableViewExtensionCallbackCollection()
        static var delegateProxy: UITableViewDelegateProxy = UITableViewDelegateProxy()
        static var emptyView: UIView = UIView()
    }
    
    fileprivate var callbackCollection: UITableViewExtensionCallbackCollection {
        get {
            return objc_getAssociatedObject(self, &AssociatedKeys.callbackCollection) as! UITableViewExtensionCallbackCollection
        }
        set {
            objc_setAssociatedObject(self, &AssociatedKeys.callbackCollection, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN)
        }
    }
    
    fileprivate var delegateProxy: UITableViewDelegateProxy {
        get {
            return objc_getAssociatedObject(self, &AssociatedKeys.delegateProxy) as! UITableViewDelegateProxy
        }
        set {
            objc_setAssociatedObject(self, &AssociatedKeys.delegateProxy, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN)
        }
    }

    var emptyView: UIView {
        get {
            return objc_getAssociatedObject(self, &AssociatedKeys.emptyView) as! UIView
        }
        set {
            objc_setAssociatedObject(self, &AssociatedKeys.emptyView, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN)
        }
    }
    
    var enableCallbacks: Bool {
        get {
            return delegate == nil ? false : delegate!.isEqual(delegateProxy)
        }
        set {
            if newValue {
                delegate = delegateProxy
            } else {
                delegate = nil
            }
        }
    }
    
    var numberOfRows: ((_ tableView: UITableView, _ section: Int) -> Int)? {
        get {
            return callbackCollection.numberOfRows
        }
        set {
            callbackCollection.numberOfRows = newValue
        }
    }
    
    var numberOfSections: ((_ tableView: UITableView) -> Int)? {
        get {
            return callbackCollection.numberOfSections
        }
        set {
            callbackCollection.numberOfSections = newValue
        }
    }
    
    var cellForRow: ((_ tableView: UITableView, _ indexPath: IndexPath) -> UITableViewCell)? {
        get {
            return callbackCollection.cellForRow
        }
        set {
            callbackCollection.cellForRow = newValue
        }
    }
    
    var cellHeight: ((_ tableView: UITableView, _ indexPath: IndexPath) -> CGFloat)? {
        get {
            return callbackCollection.cellHeight
        }
        set {
            callbackCollection.cellHeight = newValue
        }
    }
    
    var estimatedCellHeight: ((_ tableView: UITableView, _ indexPath: IndexPath) -> CGFloat)? {
        get {
            return callbackCollection.estimatedCellHeight
        }
        set {
            callbackCollection.estimatedCellHeight = newValue
        }
    }
    
    var headerForSection: ((_ tableView: UITableView, _ section: Int) -> UIView?)? {
        get {
            return callbackCollection.viewForHeader
        }
        set {
            callbackCollection.viewForHeader = newValue
        }
    }
    
    var footerForSection: ((_ tableView: UITableView, _ section: Int) -> UIView?)? {
        get {
            return callbackCollection.viewForFooter
        }
        set {
            callbackCollection.viewForFooter = newValue
        }
    }
    
    var heightForHeaderInSection: ((_ tableView: UITableView, _ section: Int) -> CGFloat)? {
        get {
            return callbackCollection.headerHeight
        }
        set {
            callbackCollection.headerHeight = newValue
        }
    }
    
    var estimatedHeightForHeaderInSection: ((_ tableView: UITableView, _ section: Int) -> CGFloat)? {
        get {
            return callbackCollection.estimatedHeaderHeight
        }
        set {
            callbackCollection.estimatedHeaderHeight = newValue
        }
    }
    
    var heightForFooterInSection: ((_ tableView: UITableView, _ section: Int) -> CGFloat)? {
        get {
            return callbackCollection.footerHeight
        }
        set {
            callbackCollection.footerHeight = newValue
        }
    }
    
    var estimatedHeightForFooterInSection: ((_ tableView: UITableView, _ section: Int) -> CGFloat)? {
        get {
            return callbackCollection.estimatedFooterHeight
        }
        set {
            callbackCollection.estimatedFooterHeight = newValue
        }
    }
    
    var willDisplayCell: ((_ tableView: UITableView, _ cell: UITableViewCell, _ indexPath: IndexPath) -> Void)? {
        get {
            return callbackCollection.willDisplayCell
        }
        set {
            callbackCollection.willDisplayCell = newValue
        }
    }
    
    var willDisplayHeader: ((_ tableView: UITableView, _ view: UIView, _ section: Int) -> Void)? {
        get {
            return callbackCollection.willDisplayHeader
        }
        set {
            callbackCollection.willDisplayHeader = newValue
        }
    }
    
    var willDisplayFooter: ((_ tableView: UITableView, _ view: UIView, _ section: Int) -> Void)? {
        get {
            return callbackCollection.willDisplayFooter
        }
        set {
            callbackCollection.willDisplayFooter = newValue
        }
    }
    
    var didEndDisplayCell: ((_ tableView: UITableView, _ cell: UITableViewCell, _ indexPath: IndexPath) -> Void)? {
        get {
            return callbackCollection.didEndDisplayCell
        }
        set {
            callbackCollection.didEndDisplayCell = newValue
        }
    }
    
    var didEndDisplayHeader: ((_ tableView: UITableView, _ view: UIView, _ section: Int) -> Void)? {
        get {
            return callbackCollection.didEndDisplayHeader
        }
        set {
            callbackCollection.didEndDisplayHeader = newValue
        }
    }
    
    var didEndDisplayFooter: ((_ tableView: UITableView, _ view: UIView, _ section: Int) -> Void)? {
        get {
            return callbackCollection.didEndDisplayFooter
        }
        set {
            callbackCollection.didEndDisplayFooter = newValue
        }
    }
    
    var willSelectRow: ((_ tableView: UITableView, _ indexPath: IndexPath) -> IndexPath?)? {
        get {
            return callbackCollection.willSelectRow
        }
        set {
            callbackCollection.willSelectRow = newValue
        }
    }
    
    var didSelectRow: ((_ tableView: UITableView, _ indexPath: IndexPath) -> Void?)? {
        get {
            return callbackCollection.didSelectRow
        }
        set {
            callbackCollection.didSelectRow = newValue
        }
    }
    
    var willDeselectRow: ((_ tableView: UITableView, _ indexPath: IndexPath) -> IndexPath)? {
        get {
            return callbackCollection.willDeselectRow
        }
        set {
            callbackCollection.willDeselectRow = newValue
        }
    }
    
    var didDeselectRow: ((_ tableView: UITableView, _ indexPath: IndexPath) -> Void)? {
        get {
            return callbackCollection.didDeselectRow
        }
        set {
            callbackCollection.didDeselectRow = newValue
        }
    }
    
    var willBeginEditing: ((_ tableView: UITableView, _ indexPath: IndexPath) -> Void)? {
        get {
            return callbackCollection.willBeginEditing
        }
        set {
            callbackCollection.willBeginEditing = newValue
        }
    }
    
    var didEndEditing: ((_ tableView: UITableView, _ indexPath: IndexPath?) -> Void)? {
        get {
            return callbackCollection.didEndEditing
        }
        set {
            callbackCollection.didEndEditing = newValue
        }
    }
    
    var editActions: ((_ tableView: UITableView, _ indexPath: IndexPath) -> [UITableViewRowAction])? {
        get {
            return callbackCollection.editActions
        }
        set {
            callbackCollection.editActions = newValue
        }
    }
    
    var shouldIndentWhileEditing: ((_ tableView: UITableView, _ indexPath: IndexPath) -> Bool)? {
        get {
            return callbackCollection.shouldIndentWhileEditing
        }
        set {
            callbackCollection.shouldIndentWhileEditing = newValue
        }
    }

    var targetIndexPathForMove: ((_ tableView: UITableView, _ sourceIndexPath: IndexPath, _ proposedDestinationIndexPath: IndexPath) -> IndexPath)? {
        get {
            return callbackCollection.targetIndexPathForMove
        }
        set {
            callbackCollection.targetIndexPathForMove = newValue
        }
    }
    
    var indentationLevel: ((_ tableView: UITableView, _ indexPath: IndexPath) -> Int)? {
        get {
            return callbackCollection.indentationLevel
        }
        set {
            callbackCollection.indentationLevel = newValue
        }
    }
    
    var shouldShowMenu: ((_ tableView: UITableView, _ indexPath: IndexPath) -> Bool)? {
        get {
            return callbackCollection.shouldShowMenu
        }
        set {
            callbackCollection.shouldShowMenu = newValue
        }
    }
    
    var canPerformAction: ((_ tableView: UITableView, _ selector: Selector, _ indexPath: IndexPath, _ sender: Any?) -> Bool)? {
        get {
            return callbackCollection.canPerformAction
        }
        set {
            callbackCollection.canPerformAction = newValue
        }
    }
    
    var performAction: ((_ tableView: UITableView, _ selector: Selector, _ indexPath: IndexPath, _ sender: Any?) -> Void)? {
        get {
            return callbackCollection.performAction
        }
        set {
            callbackCollection.performAction = newValue
        }
    }
    
    var canFocus: ((_ tableView: UITableView, _ indexPath: IndexPath) -> Bool)? {
        get {
            return callbackCollection.canFocus
        }
        set {
            callbackCollection.canFocus = newValue
        }
    }
    
    var indexPathForPreferredFocusedView: ((_ tableView: UITableView) -> IndexPath?)? {
        get {
            return callbackCollection.indexPathForPreferredFocusedView
        }
        set {
            callbackCollection.indexPathForPreferredFocusedView = newValue
        }
    }
    
    var accessoryButtonTapped: ((_ tableView: UITableView, _ indexPath: IndexPath) -> Void)? {
        get {
            return callbackCollection.accessoryButtonTapped
        }
        set {
            callbackCollection.accessoryButtonTapped = newValue
        }
    }
    
    var shouldHighlight: ((_ tableView: UITableView, _ indexPath: IndexPath) -> Bool)? {
        get {
            return callbackCollection.shouldHighlight
        }
        set {
            callbackCollection.shouldHighlight = newValue
        }
    }
    
    var didHighlight: ((_ tableView: UITableView, _ indexPath: IndexPath) -> Void)? {
        get {
            return callbackCollection.didHighlight
        }
        set {
            callbackCollection.didHighlight = newValue
        }
    }
    
    var didUnhighlight: ((_ tableView: UITableView, _ indexPath: IndexPath) -> Void)? {
        get {
            return callbackCollection.didUnhighlight
        }
        set {
            callbackCollection.didUnhighlight = newValue
        }
    }
    
    var editingStyle: ((_ tableView: UITableView, _ indexPath: IndexPath) -> UITableViewCell.EditingStyle)? {
        get {
            return callbackCollection.editingStyle
        }
        set {
            callbackCollection.editingStyle = newValue
        }
    }
    
    var titleForDeleteConfirmationButton: ((_ tableView: UITableView, _ indexPath: IndexPath) -> String)? {
        get {
            return callbackCollection.titleForDeleteConfirmationButton
        }
        set {
            callbackCollection.titleForDeleteConfirmationButton = newValue
        }
    }
    
    func showEmptyView() {
        bringSubviewToFront(emptyView)
        setSubview(emptyView)
                .all(.zero)
    }
    
    func hideEmptyView() {
        emptyView.removeFromSuperview()
    }
}

fileprivate class UITableViewDelegateProxy: NSObject, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableView.numberOfRows?(tableView, section) ?? 0
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return tableView.numberOfSections?(tableView) ?? 0
     }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return tableView.cellForRow?(tableView, indexPath) ?? UITableViewCell()
    }
    func tableView(_ tableView: UITableView, estimatedHeightForFooterInSection section: Int) -> CGFloat {
        return tableView.estimatedHeightForFooterInSection?(tableView, section) ?? 0
    }
    func tableView(_ tableView: UITableView, estimatedHeightForHeaderInSection section: Int) -> CGFloat {
        return tableView.estimatedHeightForHeaderInSection?(tableView, section) ?? 0
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return tableView.cellHeight?(tableView, indexPath) ?? 0
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return tableView.headerForSection?(tableView, section)
    }
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return tableView.footerForSection?(tableView, section)
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return tableView.heightForHeaderInSection?(tableView, section) ?? 0
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return tableView.heightForFooterInSection?(tableView, section) ?? 0
    }
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return tableView.estimatedCellHeight?(tableView, indexPath) ?? 0
    }
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        tableView.willDisplayCell?(tableView, cell, indexPath)
    }
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        tableView.willDisplayHeader?(tableView, view, section)
    }
    func tableView(_ tableView: UITableView, willDisplayFooterView view: UIView, forSection section: Int) {
        tableView.willDisplayFooter?(tableView, view, section)
    }
    func tableView(_ tableView: UITableView, didEndDisplaying cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        tableView.didEndDisplayCell?(tableView, cell, indexPath)
    }
    func tableView(_ tableView: UITableView, didEndDisplayingHeaderView view: UIView, forSection section: Int) {
        tableView.didEndDisplayHeader?(tableView, view, section)
    }
    func tableView(_ tableView: UITableView, didEndDisplayingFooterView view: UIView, forSection section: Int) {
        tableView.didEndDisplayFooter?(tableView, view, section)
    }
    func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        return tableView.willSelectRow?(tableView, indexPath)
    }
    func tableView(_ tableView: UITableView, willDeselectRowAt indexPath: IndexPath) -> IndexPath? {
        return tableView.willDeselectRow?(tableView, indexPath)
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.didSelectRow?(tableView, indexPath)
    }
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        tableView.didDeselectRow?(tableView, indexPath)
    }
    func tableView(_ tableView: UITableView, targetIndexPathForMoveFromRowAt sourceIndexPath: IndexPath, toProposedIndexPath proposedDestinationIndexPath: IndexPath) -> IndexPath {
        return tableView.targetIndexPathForMove?(tableView, sourceIndexPath, proposedDestinationIndexPath) ?? IndexPath(row: 0, section: 0)
    }
    func tableView(_ tableView: UITableView, indentationLevelForRowAt indexPath: IndexPath) -> Int {
        return tableView.indentationLevel?(tableView, indexPath) ?? 0
    }
    func tableView(_ tableView: UITableView, shouldShowMenuForRowAt indexPath: IndexPath) -> Bool {
        return tableView.shouldShowMenu?(tableView, indexPath) ?? false
    }
    func tableView(_ tableView: UITableView, canPerformAction action: Selector, forRowAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return tableView.canPerformAction?(tableView, action, indexPath, sender) ?? false
    }
    func tableView(_ tableView: UITableView, performAction action: Selector, forRowAt indexPath: IndexPath, withSender sender: Any?) {
        tableView.performAction?(tableView, action, indexPath, sender)
    }
    func tableView(_ tableView: UITableView, canFocusRowAt indexPath: IndexPath) -> Bool {
        return tableView.canFocus?(tableView, indexPath) ?? false
    }
    func indexPathForPreferredFocusedView(in tableView: UITableView) -> IndexPath? {
        return tableView.indexPathForPreferredFocusedView?(tableView)
    }
    func tableView(_ tableView: UITableView, willBeginEditingRowAt indexPath: IndexPath) {
        tableView.willBeginEditing?(tableView, indexPath)
    }
    func tableView(_ tableView: UITableView, didEndEditingRowAt indexPath: IndexPath?) {
        tableView.didEndEditing?(tableView, indexPath)
    }
    func tableView(_ tableView: UITableView, shouldIndentWhileEditingRowAt indexPath: IndexPath) -> Bool {
        return tableView.shouldIndentWhileEditing?(tableView, indexPath) ?? false
    }
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        return tableView.editActions?(tableView, indexPath)
    }
    func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
        tableView.accessoryButtonTapped?(tableView, indexPath)
    }
    func tableView(_ tableView: UITableView, shouldHighlightRowAt indexPath: IndexPath) -> Bool {
        return tableView.shouldHighlight?(tableView, indexPath) ?? false
    }
    func tableView(_ tableView: UITableView, didHighlightRowAt indexPath: IndexPath) {
        tableView.didHighlight?(tableView, indexPath)
    }
    func tableView(_ tableView: UITableView, didUnhighlightRowAt indexPath: IndexPath) {
        tableView.didUnhighlight?(tableView, indexPath)
    }
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return tableView.editingStyle?(tableView, indexPath) ?? .none
    }
    func tableView(_ tableView: UITableView, titleForDeleteConfirmationButtonForRowAt indexPath: IndexPath) -> String? {
        return tableView.titleForDeleteConfirmationButton?(tableView, indexPath)
    }
}
