//
//  GalleryViewController.swift
//  myPart
//
//  Created by Shotiko Klibadze on 06.07.21.
//

import UIKit

class GalleryViewController: BaseViewController {

    @IBOutlet var galleryCollectionView: UICollectionView!
    
    private var dataSource : GalleryDataSource!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    
    func configureViewModel() {
        dataSource = GalleryDataSource(with: galleryCollectionView)
    }
    



}
