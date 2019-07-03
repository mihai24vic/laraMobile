//
//  UserService.swift
//  Artable
//
//  Created by Mike on 01/07/2019.
//  Copyright © 2019 MikeComp. All rights reserved.
//

import Foundation

let UserService = _UserService()

final class _UserService {
    //Variables
    var user = User()
    var favorites = [Product]()
    let defaultValues = UserDefaults.standard
//    var userId = defaultValues.string(forKey: "userId")
//    var userEmail = defaultValues.string(forKey: "email")
//    var userName = defaultValues.string(forKey: "username")
//    var stripeId = defaultValues.string(forKey: "username")
    
    func getCurrentUser(){
        self.user = User.init(id: defaultValues.string(forKey: "userId") ?? "", email: defaultValues.string(forKey: "email") ?? "", username: defaultValues.string(forKey: "username") ?? "", stripeId: defaultValues.string(forKey: "") ?? "")
        
        print(self.user)
        //guard let defaultValues.string(forKey: "username")
        
//        get user favorite and  - self.favorites.append(fav)
        //let favorite = Product.init(data :)
    
    }
    
    func logoutUser(){
        let domain = Bundle.main.bundleIdentifier!
        UserDefaults.standard.removePersistentDomain(forName: domain)
        UserDefaults.standard.synchronize()
        user = User()
        favorites.removeAll()
    }
    
}
