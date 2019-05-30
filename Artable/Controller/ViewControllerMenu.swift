//
//  ViewControllerMenu.swift
//  Artable
//
//  Created by Mike on 30/05/2019.
//  Copyright © 2019 MikeComp. All rights reserved.
//

import UIKit

class ViewControllerMenu: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
sideMenu()
        // Do any additional setup after loading the view.
    }
    

    @IBOutlet weak var menuButton: UIBarButtonItem!
    /*
    // MARK: - Navigation
     
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    func sideMenu(){
        if revealViewController() != nil {
            menuButton.target = revealViewController()
            menuButton.action = #selector(SWRevealViewController.revealToggle(_:))
            revealViewController()?.rearViewRevealWidth = 280
            
            view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
    }

}
