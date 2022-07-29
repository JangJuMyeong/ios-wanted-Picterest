//
//  PhotoCollectionViewCell.swift
//  Picterest
//
//  Created by 장주명 on 2022/07/26.
//

import UIKit

class PhotoCollectionViewCell: UICollectionViewCell {
    
    var cornerRadius: CGFloat = 15
    var pressButton : (() -> Void)?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        contentView.layer.cornerRadius = cornerRadius
        contentView.layer.masksToBounds = true
    }
    
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var photoCountLabel: UILabel!
    
    @IBAction func tapSaveButton(_ sender: UIButton) {
        pressButton?()
    }
}
