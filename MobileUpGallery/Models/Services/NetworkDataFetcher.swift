//
//  NetworkDataFetcher.swift
//  MobileUpGallery
//
//  Created by Ален Авако on 29.03.2022.
//

import Foundation

protocol DataFetcher {
    func getPhotos(response: @escaping (PhotoResponse?) -> Void)
}

struct NetworkDataFetcher: DataFetcher {
    
    let networking: Networking
    
    init(networking: Networking) {
        self.networking = networking
    }
    
    func getPhotos(response: @escaping (PhotoResponse?) -> Void) {
        networking.request(path: API.albumPhotos) { data, error in
            if let error = error {
                print("Error received requesting data: \(error.localizedDescription)")
                response(nil)
            }
            
            let decoded = self.decodeJSON(type: PhotoResponseWrapped.self, from: data)
            response(decoded?.response)
        }
    }
    
    private func decodeJSON<T: Decodable>(type: T.Type, from: Data?) -> T? {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        guard let data = from, let response = try? decoder.decode(type.self, from: data) else { return nil }
        return response
    }
}
