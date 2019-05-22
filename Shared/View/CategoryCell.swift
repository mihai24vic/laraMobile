//
//  CategoryCell.swift
//  Artable
//
//  Created by Mike on 12/05/2019.
//  Copyright © 2019 MikeComp. All rights reserved.
//

import UIKit
import Kingfisher

class CategoryCell: UICollectionViewCell {

    @IBOutlet weak var categoryImg: UIImageView!
    @IBOutlet weak var categoryLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        categoryImg.layer.cornerRadius = 5
        
        
    }
    
    func configureCell(category: Category){
        categoryLabel.text = category.name
        if let url = URL (string: category.imagUrl){
            categoryImg.kf.setImage(with: url)
        }
    }

}
