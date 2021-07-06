//
//  GalleryViewModel.swift
//  GalleryProject
//
//  Created by Zura Kobakhidze on 06.07.21.
//

import UIKit

protocol GalleryViewModelProtocol: AnyObject{
    func getSavedImage() -> [URL]?
}

final class GalleryViewModel: GalleryViewModelProtocol{
    
    let fileManager = FileManager.default
    
    private var docuemntsDirectoryURL: URL? {
        try? fileManager.url(for: .documentDirectory,
                             in: .allDomainsMask,
                             appropriateFor: nil,
                             create: false)
    }
    
    func getSavedImage() -> [URL]? {
        guard let docuemntsDirectoryURL = docuemntsDirectoryURL else { return nil }
        
        let dataPath = docuemntsDirectoryURL.appendingPathComponent("GalleryImages")
        
        print(dataPath)
        
        if !FileManager.default.fileExists(atPath: dataPath.path) {
            do {
                try FileManager.default.createDirectory(atPath: dataPath.path, withIntermediateDirectories: true, attributes: nil)
            } catch {
                print(error.localizedDescription)
            }
        }
        
        guard let contentUrls = try? fileManager.contentsOfDirectory(at: dataPath,
                                                                     includingPropertiesForKeys: nil,
                                                                     options: [.skipsHiddenFiles])  else { return nil }
        
        
        
        let filtered = contentUrls.filter { $0.pathExtension == "png" }
        
        return filtered
    }
    
}
