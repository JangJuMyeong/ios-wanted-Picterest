//
//  Endpoint.swift
//  Picterest
//
//  Created by 장주명 on 2022/07/25.
//

import Foundation

protocol RequestResponsable: Requestable, Responsable {}

struct EndPoint<R>: RequestResponsable {
    typealias Response = R
    var baseURL: String
    var path: String
    var method: HttpMethod
    var queryParameters: Encodable?
    var bodyParameters: Encodable?
    var headers: [String:String]?
    var sampleData: Data?
    init(baseURL: String, path: String = "", method: HttpMethod = .get, queryParameters: Encodable? = nil, bodyParameters: Encodable? = nil, headers:[String:String]? = nil, sampleData: Data? = nil) {
        self.baseURL = baseURL
        self.path = path
        self.method = method
        self.queryParameters = queryParameters
        self.bodyParameters = bodyParameters
        self.headers = headers
        self.sampleData = sampleData
    }
}

