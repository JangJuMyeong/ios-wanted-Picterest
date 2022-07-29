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
<<<<<<< HEAD
<<<<<<< HEAD
=======
    private var photoInfoList = [PhotoInfo]()
>>>>>>> d153df4 ([#1] feat : 첫번째 페이지 CollectionView 구성 완료)
=======
>>>>>>> 17ea788 ([#1] fix : ColectionView 스크롤시 Button 이미지 다시 리셋되던것 수정)
    
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
<<<<<<< HEAD
<<<<<<< HEAD
                var photoInfoList = [PhotoInfo]()
=======
>>>>>>> d153df4 ([#1] feat : 첫번째 페이지 CollectionView 구성 완료)
=======
                var photoInfoList = [PhotoInfo]()
>>>>>>> 17ea788 ([#1] fix : ColectionView 스크롤시 Button 이미지 다시 리셋되던것 수정)
                responesDTO.forEach { info in
                    photoInfoList.append(info.toDomain())
                }
<<<<<<< HEAD
<<<<<<< HEAD
                completion(.success(photoInfoList))
=======
                completion(.success(self.photoInfoList))
>>>>>>> d153df4 ([#1] feat : 첫번째 페이지 CollectionView 구성 완료)
=======
                completion(.success(photoInfoList))
>>>>>>> 17ea788 ([#1] fix : ColectionView 스크롤시 Button 이미지 다시 리셋되던것 수정)
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func loadImage(url: String, completion: @escaping (Result<Data,Error>) -> Void) {
        if let url = NSURL(string: url), let data = imageCache.object(forKey: url) {
            completion(.success(data as Data))
        } else {
<<<<<<< HEAD
<<<<<<< HEAD
            if let url = URL(string: url) {
                provider.request(url) { result in
                    switch result {
                    case .success(let data):
                        self.imageCache.setObject(data as NSData, forKey: url as NSURL)
                        completion(.success(data))
                    case .failure(let error):
=======
//            let endpoint = APIEndpoints.getImage(with: url)
=======
>>>>>>> d153df4 ([#1] feat : 첫번째 페이지 CollectionView 구성 완료)
            if let url = URL(string: url) {
                provider.request(url) { result in
                    switch result {
                    case .success(let data):
                        self.imageCache.setObject(data as NSData, forKey: url as NSURL)
                        completion(.success(data))
<<<<<<< HEAD
                    case .failure(let error) :
>>>>>>> b42669a ([#1] feat : CollectionView 구성 및 초기 Pagination 구현)
=======
                    case .failure(let error):
>>>>>>> d153df4 ([#1] feat : 첫번째 페이지 CollectionView 구성 완료)
                        completion(.failure(error))
                    }
                }
            }
        }
    }
}
