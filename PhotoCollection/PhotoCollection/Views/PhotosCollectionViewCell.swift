//
//  PhotosCollectionViewCell.swift
//  PhotoCollection
//
//  Created by Dahna on 3/26/20.
//  Copyright © 2020 Dahna Buenrostro. All rights reserved.
//

import UIKit

class PhotosCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    
    var photo: Photo? {
        didSet{
            updateViews()
        }
    }
    
    func updateViews() {
       
        guard let photo = photo else { return }
        
        imageView.image = UIImage(data: photo.imageData)
        titleLabel.text = photo.title
        
    }
}
