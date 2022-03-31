//
//  PhotoArray.swift
//  MobileUpGallery
//
//  Created by Ален Авако on 30.03.2022.
//

import Foundation

struct PhotoArray {
    static var photoArray = [PhotoItem]()
    
    func getPhotoArray(_ photoArray: [PhotoItem]) {
        PhotoArray.photoArray = photoArray
    }
}
