//
//  PhotoCollectionViewCell.swift
//  MobileUpGallery
//
//  Created by Ален Авако on 29.03.2022.
//

import UIKit

final class PhotoCollectionViewCell: UICollectionViewCell {
    
    static let id = "PhotoCollectionViewCell"
    
    private lazy var photo: WebImageView = {
        let photo = WebImageView()
        photo.toAutoLayout()
        photo.contentMode = .scaleAspectFill
        photo.clipsToBounds = true
        return photo
    }()
    
    var cellPhoto: PhotoItem! {
        didSet {
            let photoURL = cellPhoto.sizes[3].url
            photo.set(imageURL: photoURL)
        }
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        photo.image = nil
    }
    
    override init(frame : CGRect) {
        super.init(frame: frame)
        backgroundColor = .blue
        contentView.addSubview(photo)
        
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configureCell(url: String) {
        photo.set(imageURL: url)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            photo.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            photo.topAnchor.constraint(equalTo: contentView.topAnchor),
            photo.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            photo.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
        ])
    }
}
