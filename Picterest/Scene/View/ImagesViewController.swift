//
//  ViewController.swift
//  Picterest
//

import UIKit

class ImagesViewController: UIViewController {
    @IBOutlet weak var photoCollectionView: UICollectionView!
    
    let viewModel = ImagesViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.photoCollectionView.dataSource = self
        self.photoCollectionView.delegate = self
        setData()
    }
    
    private func setData() {
        viewModel.viewImageList()
        viewModel.photoList.bind { photoList in
            print(photoList)
            DispatchQueue.main.async {
                self.photoCollectionView.reloadData()
            }
        }
    }


}

extension ImagesViewController : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.photoList.value.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoCell", for: indexPath) as? PhotoCollectionViewCell else { return UICollectionViewCell() }
        
        return cell
    }
    
    
}

extension ImagesViewController : UICollectionViewDelegateFlowLayout {
    
}

