//
//  VKLogInViewController.swift
//  MobileUpGallery
//
//  Created by Ален Авако on 25.03.2022.
//

import UIKit
import VK_ios_sdk

class PhotoCollectionViewController: UIViewController {

    private var fetcher: DataFetcher = NetworkDataFetcher(networking: NetworkService())

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setUpNavBar()
        
        fetcher.getPhotos { photoResponse in
            guard let photoResponse = photoResponse else { return }
            photoResponse.items.map { photoItem in
//                print(photoItem.date)
            }
        }
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()

    }
    
    private func setUpNavBar() {
        title = "Mobile Up Gallery"
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            title: "Выход",
            style: .plain,
            target: self,
            action: #selector(vkExit))
    }
    
    @objc private func vkExit() {
        print("exit")
        VKSdk.forceLogout()
    }
}
