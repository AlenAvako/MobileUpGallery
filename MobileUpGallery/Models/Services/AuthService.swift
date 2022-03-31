//
//  AuthService.swift
//  MobileUpGallery
//
//  Created by Ален Авако on 29.03.2022.
//

import Foundation
import VK_ios_sdk

protocol AuthServiceDelegate: AnyObject {
    func authServiceShouldShow(_ viewController: UIViewController)
    func authServiceSignIn()
    func authServiceSignInDidFailed()
}

class AuthService: NSObject, VKSdkDelegate, VKSdkUIDelegate {
    
    private let appId = "8117615"
    private let vkSdk: VKSdk
    
    weak var delegate: AuthServiceDelegate?
    
    var token: String? {
        return VKSdk.accessToken().accessToken
    }
    
    override init() {
        vkSdk = VKSdk.initialize(withAppId: appId)
        super.init()
        print("VKSdk.initialize")
        vkSdk.register(self)
        vkSdk.uiDelegate = self
    }
    
    func wakeUpSession() {
        let scope = ["offline"]
        VKSdk.wakeUpSession(scope) { [delegate] (state, error) in
            switch state {
            case .initialized:
                VKSdk.authorize(scope )
            case .authorized:
                delegate?.authServiceSignIn()
            default:
                delegate?.authServiceSignInDidFailed()
            }
        }
    }
    
    func vkSdkAccessAuthorizationFinished(with result: VKAuthorizationResult!) {
        if result.token != nil {        
            delegate?.authServiceSignIn()
        }
    }
    
    func vkSdkUserAuthorizationFailed() {
        delegate?.authServiceSignInDidFailed()
    }
    
    func vkSdkShouldPresent(_ controller: UIViewController!) {
        delegate?.authServiceShouldShow(controller)
    }
    
    func vkSdkNeedCaptchaEnter(_ captchaError: VKError!) {
        print(#function)
    }
}
