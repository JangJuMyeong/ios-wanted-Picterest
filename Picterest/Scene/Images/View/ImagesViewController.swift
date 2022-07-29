//
//  ViewController.swift
//  Picterest
//

import UIKit

class ImagesViewController: UIViewController {

    @IBOutlet weak var photoCollectionView: UICollectionView!
    
    let viewModel = ImagesViewModel()
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
    let fileManger = ImageFileManger()
    
>>>>>>> 46ff32b ([#5] feat : 두번쨰 화면 CollectionView 구성 및 기능 구현)
    
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
=======
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setInit()
        setData()
    }
    
    private func setInit() {
>>>>>>> d153df4 ([#1] feat : 첫번째 페이지 CollectionView 구성 완료)
        let layout = PhotoCollectionViewLayout()
        layout.delegate = self
        self.photoCollectionView.collectionViewLayout = layout
        self.photoCollectionView.dataSource = self
        self.photoCollectionView.delegate = self
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
        NotificationCenter.default.addObserver(self, selector: #selector(deletImage(_:)), name: .cancleSavedImage, object: nil)
>>>>>>> 46ff32b ([#5] feat : 두번쨰 화면 CollectionView 구성 및 기능 구현)
    }

    private func setData() {
        viewModel.viewImageList()
        viewModel.photoList.bind { photoList in
            DispatchQueue.main.async {
                self.photoCollectionView.reloadSections(IndexSet(integer: 0))
=======
        setData()
=======
>>>>>>> d153df4 ([#1] feat : 첫번째 페이지 CollectionView 구성 완료)
    }
    
    private func setData() {
        viewModel.viewImageList()
        viewModel.photoList.bind { photoList in
            DispatchQueue.main.async {
<<<<<<< HEAD
//                let indexPaths = Array(self.index...(self.index + 14)).map { IndexPath(item: $0, section: 0) }
//                self.photoCollectionView.reloadItems(at: indexPaths)
//                self.index += 15
                self.photoCollectionView.reloadData()
>>>>>>> b42669a ([#1] feat : CollectionView 구성 및 초기 Pagination 구현)
=======
                self.photoCollectionView.reloadSections(IndexSet(integer: 0))
>>>>>>> d153df4 ([#1] feat : 첫번째 페이지 CollectionView 구성 완료)
            }
        }
    }
    
    @objc func deletImage(_ notification: Notification) {
        let model = notification.object as! ImageInfo
        if let index = viewModel.photoList.value.firstIndex(where: {$0.id == model.id}) {
            viewModel.photoList.value[index].isSaved = false
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
        
<<<<<<< HEAD
<<<<<<< HEAD
        cell.viewController = self
        cell.photoCountLabel.text = "\(indexPath.row)번째 사진"
        cell.setButtonImage(isSaved: model.isSaved)
        cell.cancleSaveImage = {
            self.viewModel.deleteImage(id: model.id)
        }
        cell.acceptSaveMemo = { [weak self] memo in
            self?.viewModel.photoList.value[indexPath.row].isSaved = true
            self?.viewModel.savedImage(image: cell.photoImageView.image ?? UIImage(), memo: memo, photoInfo: model)
        }
=======
        cell.photoCountLabel.text = "\(indexPath.row)번째 사진"
>>>>>>> b42669a ([#1] feat : CollectionView 구성 및 초기 Pagination 구현)
=======
        cell.viewController = self
        cell.photoCountLabel.text = "\(indexPath.row)번째 사진"
        cell.setButtonImage(isSaved: model.isSaved)
        cell.acceptSaveMemo = { memo in
            self.viewModel.photoList.value[indexPath.row].isSaved = true
            print(memo)
        }
>>>>>>> d153df4 ([#1] feat : 첫번째 페이지 CollectionView 구성 완료)
        
        viewModel.loadImage(url: model.urls.small) { result in
            print(model.urls.small)
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
<<<<<<< HEAD
=======
        cell.pressButton = { [unowned self] in
            print(self.viewModel.viewState)
        }
        
>>>>>>> b42669a ([#1] feat : CollectionView 구성 및 초기 Pagination 구현)
=======
>>>>>>> d153df4 ([#1] feat : 첫번째 페이지 CollectionView 구성 완료)
        return cell
    }
}


//MARK: - UIScrollViewDelegate
extension ImagesViewController: UICollectionViewDelegate, UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let position = scrollView.contentOffset.y
        if position > photoCollectionView.contentSize.height - scrollView.frame.size.height {
<<<<<<< HEAD
<<<<<<< HEAD
=======
            print("call")
>>>>>>> b42669a ([#1] feat : CollectionView 구성 및 초기 Pagination 구현)
=======
>>>>>>> d153df4 ([#1] feat : 첫번째 페이지 CollectionView 구성 완료)
            viewModel.viewImageList()
        }
    }
}


<<<<<<< HEAD
<<<<<<< HEAD

=======
>>>>>>> b42669a ([#1] feat : CollectionView 구성 및 초기 Pagination 구현)
=======

>>>>>>> d153df4 ([#1] feat : 첫번째 페이지 CollectionView 구성 완료)
