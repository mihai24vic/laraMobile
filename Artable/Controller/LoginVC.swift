//
//  LoginVC.swift
//  Artable
//
//  Created by Mike on 06/05/2019.
//  Copyright © 2019 MikeComp. All rights reserved.
//

import UIKit
import Firebase


class LoginVC: UIViewController {

    @IBOutlet weak var emailTxt: UITextField!
    @IBOutlet weak var passwordTxt: UITextField!
    
    @IBOutlet weak var acitivityIndicator: UIActivityIndicatorView!
    @IBAction func forgotPassClicked(_ sender: Any) {
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func loginClicked(_ sender: Any) {
        guard let email = emailTxt.text , email.isNotEmpty,
            let password = passwordTxt.text , password.isNotEmpty else {return}
        
        acitivityIndicator.startAnimating()
        Auth.auth().signIn(withEmail: email, password: password) {(user, error) in
            if let error = error {
                debugPrint(error)
                self.acitivityIndicator.stopAnimating()
                return
            }
            self.acitivityIndicator.stopAnimating()
            self.dismiss(animated: true, completion: nil)
            
        }
    }
    
    @IBAction func questCliked(_ sender: Any) {
    }
}
