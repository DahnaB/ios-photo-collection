//
//  ThemeHelper.swift
//  PhotoCollection
//
//  Created by Dahna on 3/26/20.
//  Copyright © 2020 Dahna Buenrostro. All rights reserved.
//

import Foundation

class ThemeHelper {
    
    let themePreferenceKey: String
    
    func setThemePreferenceToDark() {
        UserDefaults.standard.set("Dark", forKey: themePreferenceKey)
    }
    
    func setThemePreferenceToBlue() {
        UserDefaults.standard.set("Blue", forKey: themePreferenceKey)
    }
    
    var themePreference: String? {
        get {
                let userPreference = UserDefaults.standard.string(forKey: themePreferenceKey)
        
                if userPreference == "Dark" {
                    return "Dark"
                } else if userPreference == "Blue" {
                    return "Blue"
                } else {
                    return nil
                }
        } set {  }
    
        
//        switch UserDefaults.standard.string(forKey: themePrefernceKey) {
//        case "Dark":
//            return "Dark"
//        case "Blue":
//            return "Blue"
//        default:
//            return nil
//        }
    }
    
    init() {
        
        self.themePreferenceKey = String()
        self.themePreference = themePreference ?? "Dark"
        setThemePreferenceToDark()
    }
}
