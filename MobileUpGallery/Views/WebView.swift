//
//  WebView.swift
//  MobileUpGallery
//
//  Created by Ален Авако on 27.03.2022.
//

import UIKit
import WebKit

class WebView: UIView {
    
    private let vkWebView = WKWebView()

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        
        configureWebView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureWebView() {
        guard let url = URL(string: "https://oauth.vk.com/authorize?client_id=8117615&redirect_uri=https://oauth.vk.com/blank.html&display=mobile") else {
            return
        }
        vkWebView.load(URLRequest(url: url))
        
        vkWebView.frame = self.bounds
        addSubview(vkWebView)
        vkWebView.toAutoLayout()
        NSLayoutConstraint.activate([
            vkWebView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            vkWebView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            vkWebView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            vkWebView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor),
        ])
    }
    
    
}

