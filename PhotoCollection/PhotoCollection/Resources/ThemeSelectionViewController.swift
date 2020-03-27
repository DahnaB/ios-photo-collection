//
//  ThemeSelectionViewController.swift
//  PhotoCollection
//
//  Created by Dahna on 3/26/20.
//  Copyright © 2020 Dahna Buenrostro. All rights reserved.
//

import UIKit

class ThemeSelectionViewController: UIViewController {
    
    var themeHelper: ThemeHelper?
    var photoController: PhotoController?
    var photo: Photo?
    
    @IBAction func selectDarkTheme(_ sender: Any) {
        themeHelper?.setThemePreferenceToDark()
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func selectBlueTheme(_ sender: Any) {
        themeHelper?.setThemePreferenceToBlue()
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

}
