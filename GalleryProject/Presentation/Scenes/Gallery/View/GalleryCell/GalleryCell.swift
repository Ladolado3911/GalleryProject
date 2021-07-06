//
//  GalleryCell.swift
//  GalleryProject
//
//  Created by Zura Kobakhidze on 06.07.21.
//

import UIKit

class GalleryCell: UITableViewCell {

    @IBOutlet weak var galleryImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(image: UIImage?){
        galleryImage.image = image
    }
    
}
