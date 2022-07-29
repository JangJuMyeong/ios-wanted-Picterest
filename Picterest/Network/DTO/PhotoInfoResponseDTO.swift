//
//  PhotoInfoDTO.swift
//  Picterest
//
//  Created by 장주명 on 2022/07/25.
//

import Foundation

struct PhotoInfoResponseDTO : Codable {
<<<<<<< HEAD
<<<<<<< HEAD
    let id : String
=======
>>>>>>> c49a32d ([#3] fix : Network 요청 잘못된것 수정)
=======
    let id : String
>>>>>>> 2c2fad8 ([#3] fix : Id값 추가하다록 수정)
    let width : Int
    let height : Int
    let urls : Urls
    let links : Links
}

struct Urls : Codable {
    let raw : String
    let full : String
    let regular : String
    let small : String
    let thumb : String
    let smalls3: String
    
    enum CodingKeys: String, CodingKey {
        case smalls3 = "small_s3"
        case raw, full, regular, small,thumb
    }
}

struct Links : Codable {
    let unsplash : String
    let html : String
    let download : String
    let downloadLocation : String
    
    enum CodingKeys: String, CodingKey {
        case unsplash = "self"
        case downloadLocation = "download_location"
        case html, download
    }
}

extension PhotoInfoResponseDTO {
    func toDomain() -> PhotoInfo {
<<<<<<< HEAD
<<<<<<< HEAD
        return PhotoInfo(id: id, width: width, height: height, urls: urls, links: links, isSaved: false)
=======
        return PhotoInfo(id: id, width: width, height: height, urls: urls, links: links)
>>>>>>> 2c2fad8 ([#3] fix : Id값 추가하다록 수정)
=======
        return PhotoInfo(id: id, width: width, height: height, urls: urls, links: links, isSaved: false)
>>>>>>> 17ea788 ([#1] fix : ColectionView 스크롤시 Button 이미지 다시 리셋되던것 수정)
    }
}
