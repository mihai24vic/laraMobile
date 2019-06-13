//
//  LoggedUserViewController.swift
//  Artable
//
//  Created by Roxi on 30/05/2019.
//  Copyright © 2019 MikeComp. All rights reserved.
//

import UIKit

class LoggedUserViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func logout(_ sender: Any) {
        
        let domain = Bundle.main.bundleIdentifier!
        UserDefaults.standard.removePersistentDomain(forName: domain)
        UserDefaults.standard.synchronize()
        
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
