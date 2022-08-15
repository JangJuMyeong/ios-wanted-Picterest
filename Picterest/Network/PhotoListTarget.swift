//
//  PhotoListTarget.swift
//  Picterest
//
//  Created by 장주명 on 2022/08/12.
//

import Foundation
import Alamofire

enum PhotoListTarget {
    case getPhotoList(PhotoInfoRequestDTO)
    case searchPhotoList(PhotoSearchRequestDTO)
}

extension PhotoListTarget: TargetType {
    
    var baseURL: String {
        return "https://api.unsplash.com/"
    }
    
    var path: String {
        switch self {
        case .getPhotoList:
            return "photos"
        case .searchPhotoList:
            return "search/photos"
        }
    }
    
    var method: HTTPMethod {
        return .get
    }
    
    var queryParameters: Encodable? {
        switch self {
        case .searchPhotoList(let searchDTO):
            return searchDTO
        case .getPhotoList(let infoDTO):
            return infoDTO
        }
    }
    
    var bodyParameters: Encodable? {
        return nil
    }
    
    var headers: [String : String]? {
        return ["Authorization":"Client-ID \(Constants.accessKey)"]
    }
    
    
}
