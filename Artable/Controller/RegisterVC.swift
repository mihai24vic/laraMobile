//
//  RegisterVC.swift
//  Artable
//
//  Created by Mike on 06/05/2019.
//  Copyright © 2019 MikeComp. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class RegisterVC : UIViewController{
    //outlets
    
    @IBOutlet weak var usernameText: UITextField!
    @IBOutlet weak var emailText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    @IBOutlet weak var confirmPassword: UITextField!
    @IBOutlet weak var passImage: UIImageView!
    
    @IBOutlet weak var passImageConfirm: UIImageView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        passwordText.addTarget(self, action: #selector(textFieldDidChange(_:)), for: UIControl.Event.editingChanged)
        passwordText.addTarget(self, action: #selector(textFieldDidChange(_:)), for: UIControl.Event.editingChanged)
    }
    
    @objc func textFieldDidChange (_ textField: UITextField){
        
        guard let passwordText = passwordText.text else {return}
        
        if textField == confirmPassword{
            passImageConfirm.isHidden = false
            passImage.isHidden = false
        }else{
            if passwordText.isEmpty {
                confirmPassword.text = ""
                passImageConfirm.isHidden = true
                passImage.isHidden = true
            }
        }
        //make it so when the passowrd mach
        if passwordText == confirmPassword.text {
            passImage.image = UIImage(named: Assets.greenCheck)
            passImageConfirm.image = UIImage(named: Assets.greenCheck)
        }else {
            passImage.image = UIImage(named: Assets.redCheck)
            passImageConfirm.image = UIImage(named: Assets.redCheck)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
 
    }
    
    
    
    @IBAction func registerClicked(_ sender: Any) {
        
    guard let username = usernameText.text, username.isNotEmpty,
          let email = emailText.text, email.isNotEmpty,
          let pass = passwordText.text, pass.isNotEmpty,
        let pass2 = confirmPassword.text, pass2.isNotEmpty else {return}
        
        activityIndicator.isHidden = false
        activityIndicator.startAnimating()
        
        Auth.auth().createUser(withEmail: email, password: pass) { (authResult, error) in
            // ...
            
            if let error = error {
                debugPrint(error)
                return
            }
            
            
            self.activityIndicator.stopAnimating()
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    
}
