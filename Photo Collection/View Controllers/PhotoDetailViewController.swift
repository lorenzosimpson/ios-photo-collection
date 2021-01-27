//
//  PhotoDetailViewController.swift
//  Photo Collection
//
//  Created by Lorenzo on 1/26/21.
//

import UIKit

class PhotoDetailViewController: UIViewController {
    

    override func viewDidLoad() {
        super.viewDidLoad()
        setTheme()
        updateViews()
    }
    
    var photoController: PhotoController?
    var photo: Photo?
    var themeHelper: ThemeHelper?
    
    @IBOutlet weak var newImageView: UIImageView!
    @IBOutlet weak var newImageTextField: UITextField!
    
    func setTheme() {
        if let theme = themeHelper?.themePreference {
            switch theme {
            case "Dark":
                view.backgroundColor = .darkGray
            default:
                view.backgroundColor = .white
            }
        } else { return }
    }
    
    func updateViews() {
        if let photo = photo {
            newImageView.image = UIImage(data: photo.imageData)
            newImageTextField.text = photo.title
        }
    }
    
    func picker() {
           let pickerController = UIImagePickerController()
           pickerController.delegate = self
           self.present(pickerController, animated: true, completion: nil)
       }
    
    
    @IBAction func addPhoto(_ sender: Any) {
        let alert = UIAlertController(title: "Photo Collection would like to\naccess your photo library", message: nil, preferredStyle: .alert)
            let okButton = UIAlertAction(title: "OK", style: .default, handler: { action in self.picker() })
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alert.addAction(cancelAction)
            alert.addAction(okButton)
            present(alert, animated: true, completion: nil)
    }
    
    @IBAction func savePhoto(_ sender: Any) {
        if let title = newImageTextField.text,
           let image = newImageView.image?.pngData() {
            if title != "" {
                if let photo = photo {
                    photoController?.updatePhoto(photo: photo, imageData: image, title: title)
                    navigationController?.popViewController(animated: true)
                } else {
                    photoController?.create(imageData: image, title: title)
                    navigationController?.popViewController(animated: true)
                    print("create block hit")
                }
            } else {
                let alert = UIAlertController(title: "Error", message: "Please add a photo and a title", preferredStyle: .alert)
                let okButton = UIAlertAction(title: "OK", style: .default, handler: nil)
                alert.addAction(okButton)
                present(alert, animated: true, completion: nil)
            }
        }
    }
        
    
}

extension PhotoDetailViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let image = info[.originalImage] as? UIImage else { return }
        newImageView.image = image
        dismiss(animated: true, completion: nil)
    }
}
