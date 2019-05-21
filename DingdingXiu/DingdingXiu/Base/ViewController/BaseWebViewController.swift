//
//  BaseWebViewController.swift
//  DingdingXiu
//
//  Created by jones on 2019/5/21.
//  Copyright © 2019 mac. All rights reserved.
//

import UIKit
import WebKit

class BaseWebViewController: BaseViewController {

    var request:URLRequest!
    lazy var webView: WKWebView = {
        let ww = WKWebView()
        ww.allowsBackForwardNavigationGestures = true
        ww.navigationDelegate = self
        ww.uiDelegate = self;
        return ww
    }()
    
    lazy var progressView: UIProgressView = {
        let pw = UIProgressView()
        pw.trackImage = UIImage.init(named: "nav_bg")
        pw.progressTintColor = UIColor.white
        return pw
    }()
    
    convenience init(url:String) {
        self.init()
        self.request = URLRequest(url: URL(string: url ?? "")!)

    }
    
    override func configNavigationBar() {
        super.configNavigationBar()
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "nav_reload"), target: self, action: #selector(reload))
    }

    @objc func reload() {
        webView.reload()
    }
    
    override func pressBack() {
        if webView.canGoBack {
            webView.goBack()
        }else
        {
            navigationController?.popViewController(animated: true)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        webView.addObserver(self, forKeyPath: "estimatedProgress", options: .new, context: nil)
        
        webView.load(request)
    }
    
    deinit {
        webView.removeObserver(self, forKeyPath: "estimatedProgress")
    }

}

extension BaseWebViewController:WKNavigationDelegate,WKUIDelegate{
    override func observeValue(forKeyPath keyPath: String?,
                               of object: Any?,
                               change: [NSKeyValueChangeKey : Any]?,
                               context: UnsafeMutableRawPointer?) {
        if (keyPath == "estimatedProgress") {
            progressView.isHidden = webView.estimatedProgress >= 1
            progressView.setProgress(Float(webView.estimatedProgress), animated: true)
        }
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        
        progressView.setProgress(0.0, animated: false)
        navigationItem.title = title ?? (webView.title ?? webView.url?.host)
    }
}
