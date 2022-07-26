//
//  PhotoCollectionViewCell.swift
//  Picterest
//
//  Created by 장주명 on 2022/07/26.
//

import UIKit

class PhotoCollectionViewCell: UICollectionViewCell {
    var pressButton : (() -> Void)?
    
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var photoCountLabel: UILabel!
    
    @IBAction func tapSaveButton(_ sender: UIButton) {
        pressButton?()
    }
}
