//
//  FavoriteVC.swift
//  Artable
//
//  Created by Mike on 12/07/2019.
//  Copyright © 2019 MikeComp. All rights reserved.
//

import UIKit

class FavoriteVC: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()

        UserService.getFavorites()
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
