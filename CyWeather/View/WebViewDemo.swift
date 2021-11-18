import UIKit
import WebKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        // 创建 WKWebView 视图
        let myWebView = WKWebView(frame: self.view.bounds)
        // 创建网页 URL
        let url = URL(string: "http://www.baidu.com")
        // 创建请求
        let req = URLRequest(url: url!)
        // 加载网页
        myWebView.load(req)
        self.view.addSubview(myWebView)
    }
}
