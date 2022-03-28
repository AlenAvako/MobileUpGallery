//
//  LogInViewController.swift
//  MobileUpGallery
//
//  Created by Ален Авако on 25.03.2022.
//

import UIKit

class LogInViewController: UIViewController {
    
    private let logInView = LogInView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
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
        let vkLogIn = VKLogInViewController()
        vkLogIn.modalPresentationStyle = .fullScreen
        present(vkLogIn, animated: true, completion: nil)
    }
}
