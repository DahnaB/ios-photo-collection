//
//  PhotosCollectionViewController.swift
//  PhotoCollection
//
//  Created by Dahna on 3/26/20.
//  Copyright © 2020 Dahna Buenrostro. All rights reserved.
//

import UIKit



class PhotosCollectionViewController: UICollectionViewController {
    
    let photoController = PhotoController()
    let themeHelper = ThemeHelper()
//    let photo = Photo(imageData: <#Data#>, title: <#String#>)
    

    override func viewDidLoad() {
        super.viewDidLoad()
        setTheme()
        collectionView.reloadData()
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return photoController.photos.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoCell", for: indexPath) as? PhotosCollectionViewCell else { fatalError("Cell is not a PhotosCollectionViewCell")}
    
        let photo = photoController.photos[indexPath.row]
        
        cell.photo = photo
    
        return cell
    }
    
    
    func setTheme() {
        
        guard themeHelper.themePreference != nil else { return }
        if themeHelper.themePreference == "Dark" {
            collectionView.backgroundColor = UIColor.darkGray
        } else if themeHelper.themePreference == "Blue" {
            collectionView.backgroundColor = UIColor.systemBlue
        }
    }
        
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "PhotoDetailSegue" {
            let vc = segue.destination as? PhotoDetailViewController
            vc?.themeHelper = self.themeHelper
            vc?.photoController = self.photoController
//            vc?.photo = self.photo
        } else if segue.identifier == "AddPhotoSegue" {
            let vc = segue.destination as? PhotoDetailViewController
            vc?.themeHelper = self.themeHelper
            vc?.photoController = self.photoController
        } else if segue.identifier == "SelectThemeSegue" {
            let vc = segue.destination as? ThemeSelectionViewController
            vc?.themeHelper = self.themeHelper
    }
}

    @IBAction func unwindAction(unwindSegue: UIStoryboardSegue) {
        
    }

}

