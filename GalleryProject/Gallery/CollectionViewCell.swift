//
//  CollectionViewCell.swift
//  myPart
//
//  Created by Shotiko Klibadze on 06.07.21.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    private var detailedImageView = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpLayOut()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setUpLayOut()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        detailedImageView.frame = bounds
    }
    
    private func setUpLayOut() {
        addSubview(detailedImageView)
        detailedImageView.contentMode = .scaleAspectFill
        detailedImageView.clipsToBounds = true
        
    }
    
    
    
    
}
