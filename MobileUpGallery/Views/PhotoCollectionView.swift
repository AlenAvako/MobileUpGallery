//
//  PhotoCollectionView.swift
//  MobileUpGallery
//
//  Created by Ален Авако on 29.03.2022.
//

import UIKit

final class PhotoCollectionView: UIView {
    
    lazy var photoCollection: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumInteritemSpacing = 2
        layout.minimumLineSpacing = 2
        layout.itemSize = .zero
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(PhotoCollectionViewCell.self, forCellWithReuseIdentifier: PhotoCollectionViewCell.id)
        collectionView.backgroundColor = UIColor(named: "AppLightGreen")
        return collectionView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        
        addSubview(photoCollection)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        photoCollection.frame = self.frame
    }
}
