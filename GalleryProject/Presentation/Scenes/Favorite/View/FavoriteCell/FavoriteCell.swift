//
//  FavoriteCell.swift
//  GalleryProject
//
//  Created by Zura Kobakhidze on 06.07.21.
//

import UIKit

class FavoriteCell: UITableViewCell {

    @IBOutlet weak var favoriteImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(image: UIImage?){
        favoriteImage.image = image
    }
    
}
