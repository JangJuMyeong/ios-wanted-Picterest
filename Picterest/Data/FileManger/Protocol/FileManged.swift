//
//  fileManged.swift
//  Picterest
//
//  Created by 장주명 on 2022/07/28.
//

import UIKit

protocol FileManged {
    func saveImage(image: UIImage, name: String, onSuccess: @escaping ((String) -> Void))
    func getSavedImage(named: String) -> UIImage?
    func deleteImage(named: String, onSuccess: @escaping ((Bool) -> Void))
}
