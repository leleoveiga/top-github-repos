//
//  NetworkManager.swift
//  core-network
//
//  Created by Leonardo Veiga on 16/08/24.
//

import Alamofire
import Foundation
import RxSwift

public class NetworkManager {
    public static let shared = NetworkManager()
    
    private let session = Session.default
    
    private init() {}
    
    public func request<T: Decodable>(_ endpoint: String,
                               method: HTTPMethod = .get,
                               parameters: Parameters? = nil,
                               headers: HTTPHeaders? = nil) -> Single<T> {
        return Single.create { single in
            let url = "\(NetworkConfig.apiUrl)\(endpoint)"
            print("url: \(url)")
            let updatedHeaders = headers.addAuthorizationHeader()
            
            let request = self.session.request(url,
                                               method: method,
                                               parameters: parameters,
                                               headers: updatedHeaders)
                .validate()
                .responseDecodable(
                    of: T.self,
                    queue: .global(qos: .userInitiated)
                ) { response in
                    print("response: \(response)")
                    print("url request: \(response.request!.url!)")
                    DispatchQueue.main.async {
                        switch response.result {
                        case .success(let value):
                            single(.success(value))
                        case .failure(let error):
                            single(.failure(error))
                        }                        
                    }
                }
            
            return Disposables.create { request.cancel() }
        }
    }
}

extension HTTPHeaders? {
    func addAuthorizationHeader() -> HTTPHeaders {
        var updatedHeaders = self ?? HTTPHeaders()
        let accessToken = ProcessInfo.processInfo.environment["API_KEY"] ?? "";
        print("accessToken: \(accessToken)")
        updatedHeaders.add(name: "Authorization", value: "Bearer \(accessToken)")
        
        return updatedHeaders
    }
}
