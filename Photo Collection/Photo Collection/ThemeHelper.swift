//
//  ThemeHelper.swift
//  Photo Collection
//
//  Created by Lorenzo on 1/20/21.
//

import Foundation


class ThemeHelper {
    
    init() {
        if themePreference == nil {
            setThemePreferenceToDark()
        }
    }
    
    let themePreferenceKey: String = "themePreference"
    
    var themePreference: String? {
        let userDefaults = UserDefaults.standard
        return userDefaults.string(forKey: themePreferenceKey)
    }
  

    func setThemePreferenceToDark() {
        let userDefaults = UserDefaults.standard
        userDefaults.set("Dark", forKey: themePreferenceKey)
        print("setting to dark from theme helper")
    }
    
    func setThemePreferenceToLight() {
        let userDefaults = UserDefaults.standard
        userDefaults.set("Light", forKey: themePreferenceKey)
    }
    
}
