//
//  LogInView.swift
//  MobileUpGallery
//
//  Created by Ален Авако on 25.03.2022.
//

import UIKit

protocol LogInViewDelegate: AnyObject {
    func logInButtonPressed()
}

class LogInView: UIView {
    
    weak var delegate: LogInViewDelegate?

    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.toAutoLayout()
        label.numberOfLines = 0
        label.text = "Mobile Up Gallery"
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 48, weight: .bold)
        return label
    }()
    
    private lazy var logInButton: UIButton = {
        let button = UIButton()
        button.toAutoLayout()
        button.setTitle("Вход через VK", for: .normal)
        button.tintColor = .white
        button.backgroundColor = .black
        button.addTarget(self, action: #selector(logIn), for: .touchUpInside)
        button.layer.cornerRadius = 8
        return button
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        
        setUpViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpViews() {
        addSubview(titleLabel)
        addSubview(logInButton)
        
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            titleLabel.widthAnchor.constraint(equalTo: self.widthAnchor, constant: -48),
            titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 164),
            
            logInButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            logInButton.widthAnchor.constraint(equalTo: self.widthAnchor, constant: -48),
            logInButton.heightAnchor.constraint(equalToConstant: 56),
            logInButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -50)
        ])
    }
    
    @objc private func logIn() {
        self.delegate?.logInButtonPressed()
    }
}
