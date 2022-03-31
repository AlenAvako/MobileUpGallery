//
//  PhotoViewController.swift
//  MobileUpGallery
//
//  Created by Ален Авако on 30.03.2022.
//

import UIKit

class PhotoViewController: UIViewController {
    
    private let photoView = PhotoView()
    
    private let photoItem: PhotoItem
    
    private var photos = [UIImage]()
    
    override func loadView() {
        super.loadView()
        
        view = photoView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureView()
        setUpNavBar()
    }
    
    init(photoItem: PhotoItem) {
        self.photoItem = photoItem
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpNavBar() {
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .action,
            target: self,
            action: #selector(sharePhoto))
    }
    
    private func configureView() {
        photoView.getPhoto = photoItem
    }
    
    @objc func sharePhoto() {
        
        let photo = photoView.getImageToSave()
        photos.append(photo)
        
        let shareController = UIActivityViewController(activityItems: photos, applicationActivities: nil)
        shareController.completionWithItemsHandler = { _, bool, _, _ in
            if bool  {
                let alert = UIAlertController(title: "Фотография сохранена", message: "", preferredStyle: .alert)
                let ok = UIAlertAction(title: "OK", style: .default, handler: nil)
                alert.addAction(ok)
                self.present(alert, animated: true, completion: nil)
                self.photos.removeAll()
            }
        }
        present(shareController, animated: true, completion: nil)
    }
}
