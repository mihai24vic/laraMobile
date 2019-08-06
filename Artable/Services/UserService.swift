//
//  UserService.swift
//  Artable
//
//  Created by Mike on 01/07/2019.
//  Copyright © 2019 MikeComp. All rights reserved.
//

import Foundation
import Alamofire

let UserService = _UserService()

final class _UserService {
    //Variables
    var user = User()
    var favorites = [Product]()
    let defaultValues = UserDefaults.standard
    let favList = ""
//    var userId = defaultValues.string(forKey: "userId")
//    var userEmail = defaultValues.string(forKey: "email")
//    var userName = defaultValues.string(forKey: "username")
//    var stripeId = defaultValues.string(forKey: "username")
    
    func getCurrentUser(){
        self.user = User.init(id: defaultValues.string(forKey: "userId") ?? "", email: defaultValues.string(forKey: "email") ?? "", username: defaultValues.string(forKey: "username") ?? "", stripeId: defaultValues.string(forKey: "") ?? "")
        print(self.user)
    
    }
    
    //func getFavorites
    func getFavorites(){
        getCurrentUser()
        let URL_USER_LOGIN = "https://laramobile.com/v1/getFavoritesPerUser.php"
        let currentUserId = user.id
        
        let params : Parameters = ["userId" : currentUserId as Any]
        
        
        Alamofire.request(URL_USER_LOGIN, method: .post, parameters: params).responseJSON
        {
        response in
            
            //getting the json value from the server
            if let result = response.result.value
            {
                let jsonData = result as! NSDictionary
                
                //if there is no error
                if(!(jsonData.value(forKey: "error") as! Bool))
                {
                    let userF = jsonData.value(forKey: "user") as! NSDictionary
                    let favId = userF.value(forKey: "favorite") as! String
                   self.defaultValues.set(favId, forKey: "favorite")
                }else{
                    //error message in case of invalid credential
                }
            }
        }
    }
    
    func logoutUser(){
        let domain = Bundle.main.bundleIdentifier!
        UserDefaults.standard.removePersistentDomain(forName: domain)
        UserDefaults.standard.synchronize()
        user = User()
        favorites.removeAll()
    }
    
    
    
    
}
