//
//  PhotosCollectionViewController.swift
//  Photo Collection
//
//  Created by Lorenzo on 1/26/21.
//

import UIKit

private let reuseIdentifier = "PhotoCell"

class PhotosCollectionViewController: UICollectionViewController {
    
    
    let photoController = PhotoController()
    let themeHelper = ThemeHelper()
    

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setTheme()
        photoController.loadFromPersistentStore()
        collectionView.reloadData()
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowPhotoDetailSegue" {
            if let photoDetailVC = segue.destination as? PhotoDetailViewController {
                photoDetailVC.themeHelper = themeHelper
                photoDetailVC.photoController = photoController
                if let index = collectionView.indexPathsForSelectedItems?.first {
                    photoDetailVC.photo = photoController.photos[index.item]
                    photoDetailVC.navigationItem.title = photoController.photos[index.item].title
                }
            }
        }
        if segue.identifier == "AddPhotoSegue" {
            if let photoDetailVC = segue.destination as? PhotoDetailViewController {
                photoDetailVC.themeHelper = themeHelper
                photoDetailVC.photoController = photoController
            }
        }
        if segue.identifier == "ThemeSelectionSegue" {
            if let themeSelectionVC = segue.destination as? ThemeSelectionViewController {
                themeSelectionVC.themeHelper = themeHelper
            }
        }
    }

    // MARK: UICollectionViewDataSource

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return photoController.photos.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)
                as? PhotosCollectionViewCell else { fatalError("Cell type does not exist")}
        // Configure the cell
        let thisPhoto = photoController.photos[indexPath.row]
        cell.photo = Photo(imageData: thisPhoto.imageData, title: thisPhoto.title)
        return cell
    }
    
    func setTheme() {
        guard let themePreference = themeHelper.themePreference else { return }
        if themePreference == "Dark" {
            collectionView.backgroundColor = .black
        } else {
            collectionView.backgroundColor = .white
        }
    }

}
