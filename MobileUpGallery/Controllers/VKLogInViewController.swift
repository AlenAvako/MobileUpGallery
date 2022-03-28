//
//  VKLogInViewController.swift
//  MobileUpGallery
//
//  Created by Ален Авако on 25.03.2022.
//

import UIKit
import WebKit

class VKLogInViewController: UIViewController {
    
    private let vkWebView = WebView()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(vkWebView)
    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()

        vkWebView.frame = view.frame
    }
}
