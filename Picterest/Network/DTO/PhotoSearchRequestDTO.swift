//
//  PhotoSearchDTO.swift
//  Picterest
//
//  Created by 장주명 on 2022/08/12.
//

import Foundation

struct PhotoSearchRequestDTO: Encodable{
    let query: String
    let page: Int
    var perPage: Int = 15
    var orderBy: OrderBy = .oldest
    
    enum CodingKeys: String, CodingKey {
        case query
        case page
        case perPage = "per_page"
        case orderBy = "order_by"
    }
}
