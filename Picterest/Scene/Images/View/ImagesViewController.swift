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
        setInit()
        setData()
    }
    
    private func setInit() {
        let layout = PhotoCollectionViewLayout()
        layout.delegate = self
        self.photoCollectionView.collectionViewLayout = layout
        self.photoCollectionView.dataSource = self
        self.photoCollectionView.delegate = self
    }
    
    private func setData() {
        viewModel.viewImageList()
        viewModel.photoList.bind { photoList in
            DispatchQueue.main.async {
                self.photoCollectionView.reloadSections(IndexSet(integer: 0))
            }
        }
    }
}

//MARK: - PhotoCollectionViewLayout
extension ImagesViewController: PhotoCollectionViewLayoutDelegate {
    func collectionView(_ collectionView: UICollectionView, ratioForImageAtIndexPath indexPath: IndexPath) -> CGFloat {
        let model = viewModel[indexPath]
        let ratio = CGFloat(model.height) / CGFloat(model.width)
        return ratio
    }
}

//MARK: - UICollectionViewDataSource
extension ImagesViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.photoList.value.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoCell", for: indexPath) as? PhotoCollectionViewCell else { return UICollectionViewCell() }
        let model = viewModel[indexPath]
        
        cell.viewController = self
        cell.photoCountLabel.text = "\(indexPath.row)번째 사진"
        cell.setButtonImage(isSaved: model.isSaved)
        cell.acceptSaveMemo = { memo in
            self.viewModel.photoList.value[indexPath.row].isSaved = true
            print(memo)
        }
        
        viewModel.loadImage(url: model.urls.small) { result in
            switch result {
            case .success(let image):
                DispatchQueue.main.async {
                    cell.photoImageView.image = image
                }
            case .failure(let error):
                print(error)
            }
        }
        
        return cell
    }
}


//MARK: - UIScrollViewDelegate
extension ImagesViewController: UICollectionViewDelegate, UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let position = scrollView.contentOffset.y
        if position > photoCollectionView.contentSize.height - scrollView.frame.size.height {
            viewModel.viewImageList()
        }
    }
}



