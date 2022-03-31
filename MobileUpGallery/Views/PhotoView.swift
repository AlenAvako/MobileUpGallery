//
//  PhotoView.swift
//  MobileUpGallery
//
//  Created by Ален Авако on 30.03.2022.
//

import UIKit

class PhotoView: UIView {

    private lazy var photo: WebImageView = {
        let photo = WebImageView()
        photo.contentMode = .scaleAspectFill
        photo.clipsToBounds = true
        photo.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.width)
        photo.center = CGPoint(x: UIScreen.main.bounds.midX, y: UIScreen.main.bounds.midY)
        return photo
    }()

    var getPhoto: PhotoItem! {
        didSet {
            let photoURL = getPhoto.sizes[9].url
            photo.set(imageURL: photoURL)
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .white
        
        addSubview(photo)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func getImageToSave() -> UIImage {
        return photo.image!
    }
}
