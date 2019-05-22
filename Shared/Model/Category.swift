//
//  Category.swift
//  Artable
//
//  Created by Mike on 12/05/2019.
//  Copyright © 2019 MikeComp. All rights reserved.
//

import Foundation
import FirebaseFirestore

struct Category{
    var name : String
    var id: String
    var imagUrl: String
    var isActive: Bool = true
    var timeStamp  : Timestamp
    
}
