//
//  CollectionDataFetcher.swift
//  MobileUpGallery
//
//  Created by Ален Авако on 30.03.2022.
//

import UIKit

struct CollectionDataFetcher {
    private var fetcher: DataFetcher = NetworkDataFetcher(networking: NetworkService())
    
    private let photoArray = PhotoArray()
    
    func fetchPhotos(_ collectionView: UICollectionView) {
        fetcher.getPhotos { photoResponse in
            guard let photoResponse = photoResponse else { return }
            photoArray.getPhotoArray(photoResponse.items)
            collectionView.reloadData()
        }
    }
}
