//
//  ViewController.swift
//  Picterest
//

import UIKit

class ImagesViewController: UIViewController {
    
    
    @IBOutlet weak var photoCollectionView: UICollectionView!
    
    let viewModel = ImagesViewModel()
    var index = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let layout = PhotoCollectionViewLayout()
        layout.delegate = self
        self.photoCollectionView.collectionViewLayout = layout
        self.photoCollectionView.dataSource = self
        self.photoCollectionView.delegate = self
        setData()
    }
    
    private func setData() {
//        viewModel.viewState.bind { state in
//            if state == .idle {
//
//            } else {
//                self.photoCollectionView.register(PhotoCollectionIndecatorView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: PhotoCollectionIndecatorView.identifier)
//            }
//        }
        viewModel.viewImageList()
        viewModel.photoList.bind { photoList in
            DispatchQueue.main.async {
//                let indexPaths = Array(self.index...(self.index + 14)).map { IndexPath(item: $0, section: 0) }
//                self.photoCollectionView.reloadItems(at: indexPaths)
//                self.index += 15
                self.photoCollectionView.reloadData()
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
        
        cell.photoCountLabel.text = "\(indexPath.row)번째 사진"
        
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
        
        cell.pressButton = { [unowned self] in
            print(self.viewModel.viewState)
        }
        
        return cell
    }
}


//MARK: - UIScrollViewDelegate
extension ImagesViewController: UICollectionViewDelegate, UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let position = scrollView.contentOffset.y
        if position > photoCollectionView.contentSize.height - scrollView.frame.size.height {
            print("call")
            viewModel.viewImageList()
        }
    }
}


