//
//  ViewController.swift
//  Picterest
//

import UIKit

class ImagesViewController: UIViewController {
    
    
    @IBOutlet weak var photoCollectionView: UICollectionView!
    
    let viewModel = ImagesViewModel()
<<<<<<< HEAD
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setInit()
        setData()
    }
    
    private func setInit() {
=======
    var index = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
>>>>>>> b42669a ([#1] feat : CollectionView 구성 및 초기 Pagination 구현)
        let layout = PhotoCollectionViewLayout()
        layout.delegate = self
        self.photoCollectionView.collectionViewLayout = layout
        self.photoCollectionView.dataSource = self
        self.photoCollectionView.delegate = self
<<<<<<< HEAD
    }
    
    private func setData() {
        viewModel.viewImageList()
        viewModel.photoList.bind { photoList in
            DispatchQueue.main.async {
                self.photoCollectionView.reloadSections(IndexSet(integer: 0))
=======
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
>>>>>>> b42669a ([#1] feat : CollectionView 구성 및 초기 Pagination 구현)
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
        
<<<<<<< HEAD
        cell.viewController = self
        cell.photoCountLabel.text = "\(indexPath.row)번째 사진"
        cell.setButtonImage(isSaved: model.isSaved)
        cell.acceptSaveMemo = { memo in
            self.viewModel.photoList.value[indexPath.row].isSaved = true
            print(memo)
        }
=======
        cell.photoCountLabel.text = "\(indexPath.row)번째 사진"
>>>>>>> b42669a ([#1] feat : CollectionView 구성 및 초기 Pagination 구현)
        
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
        
<<<<<<< HEAD
=======
        cell.pressButton = { [unowned self] in
            print(self.viewModel.viewState)
        }
        
>>>>>>> b42669a ([#1] feat : CollectionView 구성 및 초기 Pagination 구현)
        return cell
    }
}


//MARK: - UIScrollViewDelegate
extension ImagesViewController: UICollectionViewDelegate, UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let position = scrollView.contentOffset.y
        if position > photoCollectionView.contentSize.height - scrollView.frame.size.height {
<<<<<<< HEAD
=======
            print("call")
>>>>>>> b42669a ([#1] feat : CollectionView 구성 및 초기 Pagination 구현)
            viewModel.viewImageList()
        }
    }
}


<<<<<<< HEAD

=======
>>>>>>> b42669a ([#1] feat : CollectionView 구성 및 초기 Pagination 구현)
