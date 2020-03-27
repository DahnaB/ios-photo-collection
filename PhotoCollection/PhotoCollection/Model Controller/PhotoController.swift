//
//  PhotoController.swift
//  PhotoCollection
//
//  Created by Dahna on 3/26/20.
//  Copyright © 2020 Dahna Buenrostro. All rights reserved.
//

import UIKit

class PhotoController {
    
    var photos: [Photo] = []
    
    func create(data: Data, title: String) {
    
    let photo = Photo(imageData: data, title: title)
        
        photos.append(photo)
    }
    
    
    func Update(photo: Photo, data: Data, title: String) {
        
    }
}
