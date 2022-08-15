//
//  TargetType.swift
//  Picterest
//
//  Created by 장주명 on 2022/08/11.
//

import Foundation
import Alamofire

protocol TargetType: URLRequestConvertible {
    var baseURL: String { get }
    var path: String { get }
    var method: HTTPMethod { get }
    var queryParameters: Encodable? { get }
    var bodyParameters: Encodable? { get }
    var headers: [String: String]? { get }
}

extension TargetType {
    func asURLRequest() throws -> URLRequest {
        let url = try baseURL.asURL()
        var urlRequset = try URLRequest(url: makeUrl(url: url), method: method)
        
        headers?.forEach {
            urlRequset.setValue($1, forHTTPHeaderField: $0)
        }
        
        if let parmas = try? bodyParameters?.toDicionary() {
            urlRequset.httpBody = try JSONSerialization.data(withJSONObject: parmas, options: [])
        }
        
        return urlRequset
    }
    
    private func makeUrl(url: URL) throws -> URL {
        var urlComponents = URLComponents(string: url.appendingPathComponent(path).absoluteString)
        
        if let parmas = try? queryParameters?.toDicionary() {
            let queryParams = parmas.map { URLQueryItem(name: $0, value: "\($1)") }
            urlComponents?.queryItems = queryParams
        }
        
        guard let rquestUrl = urlComponents?.url else { throw NetworkError.componentsError }
        return rquestUrl
        
    }
}
