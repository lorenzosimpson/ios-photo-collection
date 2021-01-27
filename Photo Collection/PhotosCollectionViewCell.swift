//
//  PhotosCollectionViewCell.swift
//  Photo Collection
//
//  Created by Lorenzo on 1/26/21.
//

import UIKit

class PhotosCollectionViewCell: UICollectionViewCell {
    
    var photo: Photo? {
        didSet {
            updateViews()
        }
    }
    
    @IBOutlet weak var cellPhoto: UIImageView!
    @IBOutlet weak var cellLabel: UILabel!
    
    func updateViews() {
        if let photo = photo {
            cellPhoto.image = UIImage(data: photo.imageData)
            cellLabel.text = photo.title
            print("update views called from cell")
        } else {
            print("new image not of type photo")
        }
       
    }
}
