//
//  PhotoController.swift
//  Photo Collection
//
//  Created by Lorenzo on 1/20/21.
//

import Foundation

class PhotoController {
    var photos: [Photo] = []
    
    func create(imageData: Data, title: String) {
        self.photos.append(Photo(imageData: imageData, title: title))
        saveToPersistentStore()
    }
    
    func updatePhoto(photo: Photo, imageData: Data, title: String) {
        
        if let index = photos.firstIndex(of: photo) {
                photos[index].imageData = imageData
                photos[index].title = title
            saveToPersistentStore()
            }
        
    }
    
    var photosURL: URL? {
        let fm = FileManager.default
        guard let directoryURL = fm.urls(for: .documentDirectory, in: .userDomainMask).first
        else {return nil}
        return directoryURL.appendingPathComponent("photos.plist")
    }
    
    func loadFromPersistentStore() {
        let decoder = PropertyListDecoder()
        guard let url = photosURL else { return }
        do {
            let photosData = try Data.init(contentsOf: url)
            let decodedPhotos = try decoder.decode([Photo].self, from: photosData)
            self.photos = decodedPhotos
        } catch {
            print("Failed to load photos")
        }
        
    }
    
    func saveToPersistentStore() {
       let encoder = PropertyListEncoder()
        guard let url = photosURL else { return }
        do {
            let photosData = try encoder.encode(photos)
            try photosData.write(to: url)
        } catch {
            print("Error saving books to store")
        }
    }
    
}
