//
//  ThemeSelectionViewController.swift
//  Photo Collection
//
//  Created by Lorenzo on 1/26/21.
//

import UIKit

class ThemeSelectionViewController: UIViewController {
    
    var themeHelper: ThemeHelper?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func selectDarkTheme(_ sender: Any) {
        if let themeHelper = themeHelper {
            themeHelper.setThemePreferenceToDark()
            print("changed to dark")
            dismiss(animated: true, completion: nil)
        } else {
            print("no theme helper instance")
        }
       
    }
    
    @IBAction func selectLightTheme(_ sender: Any) {
        if let themeHelper = themeHelper {
            themeHelper.setThemePreferenceToLight()
            print("changed to light")
            dismiss(animated: true, completion: nil)
        } else {
            print("no theme helper instance")
        }
       
    }
}
