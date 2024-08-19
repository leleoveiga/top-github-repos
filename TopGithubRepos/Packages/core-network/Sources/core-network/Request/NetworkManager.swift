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
    
    fileprivate func log<T: Decodable>(_ response: DataResponse<T, AFError>) {
        if let requestUrl = response.request?.url {
            print("============== RESPONSE ==============\n - url request: \(requestUrl) ")
            if let data = response.data, let utf8Text = String(data: data, encoding: .utf8) {
                print("Data: \(utf8Text.prettyPrintJSON())")
            }
        }
        if let detailedError = response.error?.underlyingError.debugDescription {
            print("============== ERROR ==============\n  \(detailedError)")
        }
        
        print("==============================")
    }
    
    public func request<T: Decodable>(_ endpoint: String,
                               method: HTTPMethod = .get,
                               parameters: Parameters? = nil,
                               headers: HTTPHeaders? = nil) -> Single<T> {
        return Single.create { single in
            let url = "\(NetworkConfig.apiUrl)\(endpoint)"
            print("==============================")
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
                    self.log(response)
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
