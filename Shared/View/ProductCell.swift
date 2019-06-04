//
//  ProductCell.swift
//  Artable
//
//  Created by Mike on 13/05/2019.
//  Copyright © 2019 MikeComp. All rights reserved.
//

import UIKit
import Kingfisher

class ProductCell: UITableViewCell {

    
    @IBOutlet weak var productImage: RoundedImageView!
    @IBOutlet weak var productTitle: UILabel!
    @IBOutlet weak var favoriteButton: UIButton!
    @IBOutlet weak var productPrice: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configureCell (product: Product){
        productTitle.text = product.name
        if let url = URL(string: product.imageURL){
            productImage.kf.setImage(with: url)
        }
        productPrice.text = String(product.price)
        
        
    }
    
    @IBAction func addToCartClicked(_ sender: Any) {
        
    }
    @IBAction func favoriteClicked(_ sender: Any) {
        
    }
}
