//
//  LoggedUserViewController.swift
//  Artable
//
//  Created by Roxi on 30/05/2019.
//  Copyright © 2019 MikeComp. All rights reserved.
//

import UIKit

class LoggedUserViewController: UIViewController {
    
    @IBAction func personalDataButtonPressed(_ sender: Any) {
         
    }
    
    @IBAction func orderHistoryButtonPressed(_ sender: Any) {
        
    }
    
    @IBAction func favoriteButtonPressed(_ sender: Any) {
        
    }
    
//    @IBAction func backButtonPressed(_ sender: Any) {
//        
//    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func logout(_ sender: Any) {
        
        UserService.logoutUser()
        presentMainController()
    }
    
    @IBAction func returnToStoreFromUser(_ sender: Any) {
        presentMainController()
    }
    
    fileprivate func presentMainController(){
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyBoard.instantiateViewController(withIdentifier: "tabView")
        present(controller, animated: true, completion: nil)
    }
    
}
