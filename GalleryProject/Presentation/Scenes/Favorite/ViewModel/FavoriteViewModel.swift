//
//  FavoriteViewModel.swift
//  GalleryProject
//
//  Created by Zura Kobakhidze on 06.07.21.
//

import Foundation

protocol FavoriteViewModelProtocol: AnyObject{
    func getSavedImage() -> [URL]?
}

final class FavoriteViewModel: FavoriteViewModelProtocol{
    let fileManager = FileManager.default
    
    private var docuemntsDirectoryURL: URL? {
        try? fileManager.url(for: .documentDirectory,
                             in: .allDomainsMask,
                             appropriateFor: nil,
                             create: false)
    }
    
    func getSavedImage() -> [URL]? {
        guard let docuemntsDirectoryURL = docuemntsDirectoryURL else { return nil }
        
        let dataPath = docuemntsDirectoryURL.appendingPathComponent("Favorite")
        
        print(dataPath)
        
        guard let contentUrls = try? fileManager.contentsOfDirectory(at: dataPath,
                                                                     includingPropertiesForKeys: nil,
                                                                     options: [.skipsHiddenFiles])  else { return nil }
        
        let filtered = contentUrls.filter { $0.pathExtension == "png" }
        
        return filtered
    }
}
