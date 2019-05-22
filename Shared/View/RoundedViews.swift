//
//  RoundedViews.swift
//  Artable
//
//  Created by Mike on 07/05/2019.
//  Copyright © 2019 MikeComp. All rights reserved.
//

import UIKit


class RoundedButton : UIButton {
    
    override func awakeFromNib(){
        super.awakeFromNib()
        layer.cornerRadius = 5
    }
}

class RoundedShadowView : UIView {
    override func awakeFromNib() {
        super.awakeFromNib()
        layer.cornerRadius = 5
        layer.shadowColor = AppColors.Blue.cgColor
        layer.shadowOpacity = 0.4
        layer.shadowOffset = CGSize.zero
        layer.shadowRadius = 3
    }
}

class RoundedImageView : UIImageView{
    override func awakeFromNib() {
        super.awakeFromNib()
        layer.cornerRadius = 5
    }
}
