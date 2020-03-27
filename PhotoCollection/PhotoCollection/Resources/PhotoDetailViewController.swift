//
//  PhotoDetailViewController.swift
//  PhotoCollection
//
//  Created by Dahna on 3/26/20.
//  Copyright © 2020 Dahna Buenrostro. All rights reserved.
//

import UIKit

class PhotoDetailViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var textField: UITextField!
    
    var imagePicker = UIImagePickerController()
    
    @IBAction func addPhoto(_ sender: Any) {
        
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            
            imagePicker.delegate = self
            imagePicker.sourceType = .photoLibrary
            imagePicker.allowsEditing = false
        }
    
    
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            picker.dismiss(animated: true, completion: nil)
            guard let image = info[.originalImage] as? UIImage else {
                fatalError("Error")
            }
                photoImageView.image = image
        }

    }
        
    @IBAction func savePhoto(_ sender: Any) {
        guard let title = textField.text,
            let data = photoImageView.image?.pngData() else { return }
        
        if let unwrappedPhoto = photo {
            photoController?.Update(photo: unwrappedPhoto, data: unwrappedPhoto.imageData, title: unwrappedPhoto.title)
        } else {
            photoController?.create(data: data, title: title)
        }
        
        navigationController?.popViewController(animated: true)
    }
    
    var photoController: PhotoController?
    var photo: Photo?
    var themeHelper: ThemeHelper?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        setTheme()
        updateViews()

    }
    
    func setTheme() {
        guard themeHelper?.themePreference != nil else { return }
        if themeHelper?.themePreference == "Dark" {
            view.backgroundColor = UIColor.darkGray
        } else if themeHelper?.themePreference == "Blue" {
            view.backgroundColor = UIColor.systemBlue
        }
    }
    
    func updateViews() {
     setTheme()
        guard let imageData = photo?.imageData else { return }
        
        photoImageView.image = UIImage(data: imageData)
        textField.text = photo?.title
    }

}

