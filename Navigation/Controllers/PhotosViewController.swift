//
//  PhotosViewController.swift
//  Navigation
//
//  Created by Oleg Popov on 11.09.2022.
//

import Foundation
import UIKit
import iOSIntPackage // импортирую расширение iOSIntPackage

class PhotosViewController: UIViewController, ImageLibrarySubscriber { //подписываюсь на расширение
 
    //Создайте для PhotosViewController экземпляр класса ImagePublisherFacade
    var imagePublisher = ImagePublisherFacade()
    
    private lazy var layout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumInteritemSpacing = 8
        layout.minimumLineSpacing = 8
        layout.sectionInset = UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 8)
        return layout
    }()

    private lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: self.layout)
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "DefaultCell")
        collectionView.register(PhotosCollectionViewCell.self, forCellWithReuseIdentifier: "CustomCell")
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.toAutoLayout()
        
        return collectionView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        self.navigationController?.navigationBar.isHidden = false
        self.title = "Photo Gallery"

        
        addViews()
        addConstraints()
        
       //подпишите ваш класс PhotosViewController на изменения, которые будет генерировать этот publisher:
        imagePublisher.subscribe(self)
        
       // Запустите сценарий наполнения коллекции изображениями через метод addImagesWithTimer
        imagePublisher.addImagesWithTimer(time: 0.5, repeat: 15)
        
    }
    
// отменяю подписку при уходе из photo gallery
    override func viewWillDisappear(_ animated: Bool) {
           super.viewWillDisappear(animated)
                 
           imagePublisher.removeSubscription(for: self)
           imagePublisher.rechargeImageLibrary()
        }
  
    
    func addViews(){
        view.addSubview(collectionView)
    }

    func addConstraints(){
        NSLayoutConstraint.activate([
            self.collectionView.topAnchor.constraint(equalTo: self.view.topAnchor),
            self.collectionView.leftAnchor.constraint(equalTo: self.view.leftAnchor),
            self.collectionView.rightAnchor.constraint(equalTo: self.view.rightAnchor),
            self.collectionView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        ])
    }
}

extension PhotosViewController : UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //return photoData.count
        return photoInSection
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CustomCell", for: indexPath) as? PhotosCollectionViewCell else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DefaultCell", for: indexPath)
            return cell
        }
       // cell.setup(name: itemImageMassive[indexPath.row])
        cell.setupImagePublisher(image:  photoCollection[indexPath.row])
        
      return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        return CGSize(width: photoSizeInAlbom, height: photoSizeInAlbom)
    }
}

extension PhotosViewController {
    func receive(images: [UIImage]) {
        
        photoCollection = images
        photoInSection = images.count
        collectionView.reloadData()
    }
    
}
