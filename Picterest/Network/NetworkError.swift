//
//  NetwrokError.swift
//  Picterest
//
//  Created by 장주명 on 2022/07/25.
//

import Foundation

enum NetworkError: LocalizedError{
    case unknownError
    case componentsError
    case urlRequestError(Error)
    case invalidHttpStatusCode(Int)
    case emptyData
    case parsingError
    case decodingError(Error)
    
    var errorDescription: String? {
        switch self {
        case .unknownError:
            return "알수 없는 에러입니다."
        case .urlRequestError:
            return "URL Request 관련 에러가 발생했습니다."
        case .componentsError:
            return "URL components 관련 에러가 발생했습니다."
        case .invalidHttpStatusCode:
            return "status코드가 200~299가 아닙니다."
        case .emptyData:
            return "데이터가 없습니다."
        case .parsingError:
            return "데이터 Parsing 중 에러가 발생했습니다."
        case .decodingError:
            return "Decoding 에러가 발생했습니다."
        }
    }
}
