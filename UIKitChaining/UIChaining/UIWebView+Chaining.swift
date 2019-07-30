import UIKit

extension UIWebView: UIWebViewChaining { }
public protocol UIWebViewChaining { }
public extension UIWebViewChaining {
    @discardableResult
    func delegate(_ delegate: UIWebViewDelegate) -> Self {
        (self as! UIWebView).delegate = delegate
        return self
    }
    @discardableResult
    func allowsInlineMediaPlayback(_ allowsInlineMediaPlayback: Bool) -> Self {
        (self as! UIWebView).allowsInlineMediaPlayback = allowsInlineMediaPlayback
        return self
    }
    @discardableResult
    func allowsLinkPreview(_ allowsLinkPreview: Bool) -> Self {
        if #available(iOS 9.0, *) {
            (self as! UIWebView).allowsLinkPreview = allowsLinkPreview
        }
        return self
    }
    @discardableResult
    func allowsPictureInPictureMediaPlayback(_ allowsPictureInPictureMediaPlayback: Bool) -> Self {
        if #available(iOS 9.0, *) {
            (self as! UIWebView).allowsPictureInPictureMediaPlayback = allowsPictureInPictureMediaPlayback
        }
        return self
    }
    @discardableResult
    func dataDetectorTypes(_ dataDetectorTypes: UIDataDetectorTypes) -> Self {
        (self as! UIWebView).dataDetectorTypes = dataDetectorTypes
        return self
    }
    @discardableResult
    func paginationMode(_ paginationMode: UIWebView.PaginationMode) -> Self {
        (self as! UIWebView).paginationMode = paginationMode
        return self
    }
    @discardableResult
    func isScrollEnabled(_ isScrollEnabled: Bool) -> Self {
        (self as! UIWebView).scrollView.isScrollEnabled = isScrollEnabled
        return self
    }
    @discardableResult
    func showsHorizontalScrollIndicator(_ showsHorizontalScrollIndicator: Bool) -> Self {
        (self as! UIWebView).scrollView.showsHorizontalScrollIndicator = showsHorizontalScrollIndicator
        return self
    }
    @discardableResult
    func showsVerticalScrollIndicator(_ showsVerticalScrollIndicator: Bool) -> Self {
        (self as! UIWebView).scrollView.showsVerticalScrollIndicator = showsVerticalScrollIndicator
        return self
    }
    @discardableResult
    func loadRequest(_ request: URLRequest) -> Self {
        (self as! UIWebView).loadRequest(request)
        return self
    }
    @discardableResult
    func loadURL(_ url: URL) -> Self {
        (self as! UIWebView).loadRequest(URLRequest(url: url))
        return self
    }
    @discardableResult
    func loadHTMLString(_ string: String, url: URL?) -> Self {
        (self as! UIWebView).loadHTMLString(string, baseURL: url)
        return self
    }
}
