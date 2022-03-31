//
//  PhotoResponse.swift
//  MobileUpGallery
//
//  Created by Ален Авако on 29.03.2022.
//

import Foundation

struct PhotoResponseWrapped: Decodable {
    let response: PhotoResponse
}

struct PhotoResponse: Decodable {
    var items: [PhotoItem]
}

struct PhotoItem: Decodable {
    let id: Int
    let date: Double
    let sizes: [Photos]
}

struct Photos: Decodable {
    let url: String
    let type: String
}
