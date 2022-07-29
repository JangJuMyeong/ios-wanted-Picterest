//
//  SavedViewModel.swift
//  Picterest
//
//  Created by 장주명 on 2022/07/26.
//

import Foundation
import UIKit
import CoreData

class SavedViewModel {
    private let repository = MediaInfoRepository()
    var imageInfoList = Observable<[ImageInfo]>([])
    
    subscript(indexPath: IndexPath) -> ImageInfo {
        return imageInfoList.value[indexPath.row]
    }
    
    func deleteImage(id: String) {
        repository.deleteImage(id: id)
        if let index = imageInfoList.value.firstIndex(where: {$0.id == id}){
            imageInfoList.value.remove(at: index)
        }
    }
    
    func viewImageList() {
        repository.getImageList { result in
            switch result {
            case .success(let imageList):
                self.imageInfoList.value = imageList
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func loadLocalImage(imageInfo: ImageInfo, completion: @escaping ((Result<UIImage,Error>) -> Void)){
        repository.loadLocalImage(imageInfo: imageInfo) { result in
            switch result {
            case .success(let image):
                completion(.success(image))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }

}
