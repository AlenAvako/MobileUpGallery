//
//  NetworkService.swift
//  MobileUpGallery
//
//  Created by Ален Авако on 29.03.2022.
//

import Foundation

protocol Networking {
    func request(path: String, completion: @escaping (Data?, Error?) -> Void)
}

class NetworkService: Networking {
    
    private let authService: AuthService
    
    init(authService: AuthService = SceneDelegate.shared().authService) {
        self.authService = authService
    }
    
    func request(path: String, completion: @escaping (Data?, Error?) -> Void) {
        guard let token = authService.token else { return }
        var allParams = ["owner_id": "-128666765", "album_id": "266276915"]
        allParams["access_token"] = token
        allParams["v"] = API.version
        
        let url = url(from: path, params: allParams)
        let request = URLRequest(url: url)
        let task = createDataTask(from: request, completion: completion)
        task.resume()
        print(url)
    }

    private func createDataTask(from request: URLRequest, completion: @escaping (Data?, Error?) -> Void) -> URLSessionDataTask {
        return URLSession.shared.dataTask(with: request) { data, response, error in
            DispatchQueue.main.async {
                completion(data, error)
            }
        }
    }
    
    private func url(from path: String, params: [String: String]) -> URL {
        var components = URLComponents()
        components.scheme = API.scheme
        components.host = API.host
        components.path = API.albumPhotos
        components.queryItems = params.map { URLQueryItem(name: $0, value: $1) }
        return components.url!
    }
}
