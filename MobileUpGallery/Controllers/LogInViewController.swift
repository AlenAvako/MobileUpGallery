//
//  LogInViewController.swift
//  MobileUpGallery
//
//  Created by Ален Авако on 25.03.2022.
//

import UIKit
import VK_ios_sdk

class LogInViewController: UIViewController {
    
    private let logInView = LogInView()
    private var authService: AuthService!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        authService = SceneDelegate.shared().authService
        setUpLogInView()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        logInView.frame = view.bounds
    }

    private func setUpLogInView() {
        view.addSubview(logInView)
        logInView.delegate = self
    }
}

extension LogInViewController: LogInViewDelegate {
    func logInButtonPressed() {
        authService.wakeUpSession() 
    }
}
