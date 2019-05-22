//
//  Product.swift
//  Artable
//
//  Created by Mike on 13/05/2019.
//  Copyright © 2019 MikeComp. All rights reserved.
//

import Foundation
import FirebaseFirestore

struct Product {
    var name : String
    var id : String
    var category : String
    var price : Double
    var productDescription : String
    var imageURL : String
    var timesStamp : Timestamp
    var stock : Int
    var favorite : Bool
}
