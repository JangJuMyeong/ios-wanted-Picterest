//
//  PhotoInfoRepository.swift
//  Picterest
//
//  Created by 장주명 on 2022/07/26.
//

import Foundation
import UIKit

class PhotoInfoRepository {
    private let provider: Provider
    private var imageCache = NSCache<NSURL,NSData>()
    private var currentPage: Int = 1
    private var photoInfoList = [PhotoInfo]()
    
    init(provider: Provider = ProviderImpl()) {
        self.provider = provider
    }
    
    func getPhotoList(completion: @escaping (Result<[PhotoInfo],Error>) -> Void) {
        let photoListRequestDTO = PhotoInfoRequestDTO(page: currentPage)
        let endpoint = APIEndpoints.getPhotosInfo(with: photoListRequestDTO)
        currentPage += 1
        provider.request(with: endpoint) { result in
            switch result {
            case .success(let responesDTO):
                responesDTO.forEach { info in
                    self.photoInfoList.append(info.toDomain())
                }
                completion(.success(self.photoInfoList))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func loadImage(url: String, completion: @escaping (Result<Data,Error>) -> Void) {
        if let url = NSURL(string: url), let data = imageCache.object(forKey: url) {
            completion(.success(data as Data))
        } else {
            if let url = URL(string: url) {
                provider.request(url) { result in
                    switch result {
                    case .success(let data):
                        self.imageCache.setObject(data as NSData, forKey: url as NSURL)
                        completion(.success(data))
                    case .failure(let error):
                        completion(.failure(error))
                    }
                }
            }
        }
    }
}
