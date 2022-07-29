//
//  ImagesViewModel.swift
//  Picterest
//
//  Created by 장주명 on 2022/07/26.
//

import Foundation
import UIKit

class ImagesViewModel {
    private let repository = PhotoInfoRepository()
    var photoList = Observable<[PhotoInfo]>([])
    var viewState = Observable<ViewState>(ViewState.idle)
    
    subscript(indexPath: IndexPath) -> PhotoInfo {
      return photoList.value[indexPath.row]
    }
    
    func viewImageList() {
        if viewState.value == .idle {
            viewState.value = .isLoding
            repository.getPhotoList { result in
                switch result {
                case .success(let photoInfos):
<<<<<<< HEAD
                    self.photoList.value.append(contentsOf: photoInfos)
=======
                    photoInfos.forEach { photoinfo in
                        self.photoList.value.append(photoinfo)
                    }
>>>>>>> b42669a ([#1] feat : CollectionView 구성 및 초기 Pagination 구현)
                    self.viewState.value = .idle
                case .failure(let error):
                    print(error)
                }
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
