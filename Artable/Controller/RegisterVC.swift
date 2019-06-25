
//  RegisterVC.swift
//  Artable
//
//  Created by Mike on 06/05/2019.
//  Copyright © 2019 MikeComp. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import Alamofire

class RegisterVC : UIViewController{
    
    let URL_USER_REGISTER = "https://stackwish.com/v1/register.php"
    
    //the defaultvalues to store user data
    let defaultValues = UserDefaults.standard
    
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
    
    
    @IBAction func backToStoreFromRegister(_ sender: Any) {
        presentMainController()
    }
    
    
    @IBAction func registerClicked(_ sender: Any) {
        
        guard let username = usernameText.text, username.isNotEmpty,
            let email = emailText.text, email.isNotEmpty,
            let pass = passwordText.text, pass.isNotEmpty,
            let pass2 = confirmPassword.text, pass2.isNotEmpty else {return}
        
        let parameters: Parameters=[
            "username":usernameText.text!,
            "password":passwordText.text!,
            "email":emailText.text!
        ]
        
        
        activityIndicator.isHidden = false
        activityIndicator.startAnimating()
        
        //making a post request
        Alamofire.request(URL_USER_REGISTER, method: .post, parameters: parameters).responseJSON
            {
                response in
                //printing response
                print("*************  \(response)")
                
                //getting the json value from the server
                if let result = response.result.value {
                    let jsonData = result as! NSDictionary
                    
                    //if there is no error
                    if(!(jsonData.value(forKey: "error") as! Bool))
                    {
                        
                        //getting the user from response
                        let user = jsonData.value(forKey: "user") as! NSDictionary
                        
                        //getting user values
                        let userId = user.value(forKey: "id") as! Int
                        let userName = user.value(forKey: "username") as! String
                        let userEmail = user.value(forKey: "email") as! String
                        
                        //saving user values to defaults
                        self.defaultValues.set(userId, forKey: "userid")
                        self.defaultValues.set(userName, forKey: "username")
                        self.defaultValues.set(userEmail, forKey: "useremail")
                        
                        self.presentMainController()
                        
                    }else{
                        //error message in case of invalid credential
                        //self.labelError.text = "Error"
                    }
                }
        }
        //            self.activityIndicator.stopAnimating()
        //            self.dismiss(animated: true, completion: nil)
    }
    
    fileprivate func presentMainController(){
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyBoard.instantiateViewController(withIdentifier: "tabView")
        present(controller, animated: true, completion: nil)
    }
    
}
