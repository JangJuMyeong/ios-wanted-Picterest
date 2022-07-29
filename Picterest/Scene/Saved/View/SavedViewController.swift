//
//  SavedViewController.swift
//  Picterest
//
//  Created by 장주명 on 2022/07/26.
//

import UIKit

class SavedViewController: UIViewController {
    
    @IBOutlet weak var savedCollectionView: UICollectionView!
    @IBOutlet weak var collectionViewHeight: NSLayoutConstraint!
    
    let viewModel = SavedViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.viewImageList()
        viewModel.imageInfoList.bind { imageInfoList in
            DispatchQueue.main.async {
                self.savedCollectionView.reloadData()
            }
        }
        let layout = SavedCollectionViewLayout()
        layout.delegate = self
        savedCollectionView.collectionViewLayout = layout
        savedCollectionView.dataSource = self
        savedCollectionView.delegate = self
        NotificationCenter.default.addObserver(self, selector: #selector(saveImage(_:)), name: .saveImage, object: nil)
    }
    
    @objc func saveImage(_ notification: Notification) {
        viewModel.viewImageList()
        DispatchQueue.main.async {
            self.savedCollectionView.reloadData()
        }
     }

}

extension SavedViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.imageInfoList.value.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SavedCell", for: indexPath) as? SavedCollectionViewCell else { return UICollectionViewCell()}
        let model = viewModel[indexPath]
        
        cell.viewController = self
        cell.memoLabel.text = model.memo
        cell.deletImage = {
            self.viewModel.deleteImage(id: model.id)
            NotificationCenter.default.post(name: .cancleSavedImage, object: model)
        }
        viewModel.loadLocalImage(imageInfo: model) { result in
            switch result {
            case.success(let image):
                DispatchQueue.main.async {
                    cell.savedImageView.image = image
                }
            case .failure(let error):
                print(error)
            }
        }
        
        return cell
    }
    
    
}

extension SavedViewController: SavedCollectionViewLayoutDelegate {
    func collectionView(_ collectionView: UICollectionView, ratioForImageAtIndexPath indexPath: IndexPath) -> CGFloat {
        return CGFloat(viewModel[indexPath].ratio)
    }
    
}

extension SavedViewController: UICollectionViewDelegate {
    
}



