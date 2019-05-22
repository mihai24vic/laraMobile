//
//  ViewController.swift
//  Artable
//
//  Created by Mike on 22/04/2019.
//  Copyright © 2019 MikeComp. All rights reserved.
//

import UIKit

class HomeVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

    }

    override func viewDidAppear(_ animated: Bool) {
        let storyBoard = UIStoryboard(name: "LoginStoryBoard", bundle: nil)
        let controller = storyBoard.instantiateViewController(withIdentifier: "logingVC")
        present(controller, animated: true, completion: nil)
    }
    

}

