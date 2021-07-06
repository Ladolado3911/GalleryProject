//
//  GalleryDataSource.swift
//  myPart
//
//  Created by Shotiko Klibadze on 06.07.21.
//

import UIKit

class GalleryDataSource: NSObject, UICollectionViewDataSource {
    
    private var collectionView: UICollectionView!
    
    
    
    private var content = [URL]()
    
    init(with collectionView : UICollectionView) {
        self.collectionView = collectionView
    }
    

    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        content.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell =  collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath)
        return cell
    }
    
    
}
