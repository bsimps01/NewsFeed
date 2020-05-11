//
//  StoriesVC.swift
//  NewsFeed
//
//  Created by Benjamin Simpson on 5/10/20.
//  Copyright © 2020 Benjamin Simpson. All rights reserved.
//

import Foundation
import UIKit
import WebKit

class StoriesVC: UIViewController, WKUIDelegate {
    
    var url: String? = nil
        
        lazy var webView: WKWebView = {
            let webConfiguration = WKWebViewConfiguration()
            let webView = WKWebView(frame: .zero, configuration: webConfiguration)
            webView.uiDelegate = self
            webView.translatesAutoresizingMaskIntoConstraints = false
            return webView
        }()
        
        override func viewDidLoad() {
            super.viewDidLoad()
            setupView()
            openWeb(from: url!)
        }
        
        func setupView() {
            self.view.addSubview(webView)
            NSLayoutConstraint.activate([
                webView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
                webView.leftAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leftAnchor),
                webView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor),
                webView.rightAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.rightAnchor),
            ])
        }
        
        func openWeb(from url: String) {
            let myURL = URL(string: url)
            let request = URLRequest(url: myURL!)
            webView.load(request)
        }
        
        
    }

