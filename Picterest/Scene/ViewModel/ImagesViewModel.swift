//
//  ImagesViewModel.swift
//  Picterest
//
//  Created by 장주명 on 2022/07/26.
//

import Foundation
import UIKit

class ImagesViewModel {
    var photoList = Observable<[PhotoInfo]>([])
    private let repository = PhotoInfoRepository()
    
    subscript(indexPath: IndexPath) -> PhotoInfo {
      return photoList.value[indexPath.row]
    }
    
    func viewImageList() {
        repository.getPhotoList { result in
            switch result {
            case .success(let photoInfos):
                self.photoList.value = photoInfos
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func loadImage(url: String, completion:@escaping (Result<UIImage,Error>) -> Void){
        repository.loadImage(url: url) { result in
            switch result {
            case .success(let data):
                guard let image = UIImage(data: data) else {
                    completion(.failure(NetworkError.parsingError))
                    return
                }
                completion(.success(image))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
