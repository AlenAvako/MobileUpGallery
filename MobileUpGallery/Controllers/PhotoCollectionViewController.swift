//
//  VKLogInViewController.swift
//  MobileUpGallery
//
//  Created by Ален Авако on 25.03.2022.
//

import UIKit
import VK_ios_sdk

class PhotoCollectionViewController: UIViewController {
    
    private let fetcher = CollectionDataFetcher()
    
    private let photoCollectionView = PhotoCollectionView()
    
    override func loadView() {
        super.loadView()
        
        view = photoCollectionView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        photoCollectionView.photoCollection.dataSource = self
        photoCollectionView.photoCollection.delegate = self
        
        setUpNavBar()
        fetcher.fetchPhotos(photoCollectionView.photoCollection)
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
        SceneDelegate.shared().window?.rootViewController = LogInViewController()
    }
}

extension PhotoCollectionViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return PhotoArray.photoArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = photoCollectionView.photoCollection.dequeueReusableCell(withReuseIdentifier: PhotoCollectionViewCell.id, for: indexPath) as! PhotoCollectionViewCell
        cell.cellPhoto = PhotoArray.photoArray[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let itemsPerRow: CGFloat = 2
        let paddindWidth: CGFloat = 2
        let accessibleWidth = collectionView.frame.width - paddindWidth
        let widthPerItem = accessibleWidth / itemsPerRow
        return CGSize(width: widthPerItem, height: widthPerItem)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let photo = PhotoArray.photoArray[indexPath.item]
        
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "ru_RU")
        dateFormatter.dateFormat = "dd MMMM yyyy"
        let date = Date(timeIntervalSince1970: photo.date)
        let dateTitle = dateFormatter.string(from: date)
        
        let photoVC = PhotoViewController(photoItem: photo)
        photoVC.title = dateTitle
        
        navigationController?.pushViewController(photoVC, animated: true)
    }
}
