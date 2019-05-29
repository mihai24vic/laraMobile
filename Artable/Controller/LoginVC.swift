//
//  LoginVC.swift
//  Artable
//
//  Created by Mike on 06/05/2019.
//  Copyright © 2019 MikeComp. All rights reserved.
//

import UIKit
import Firebase
import Alamofire


class LoginVC: UIViewController {
    
    //The login script url make sure to write the ip instead of localhost
    //you can get the ip using ifconfig command in terminal
    let URL_USER_LOGIN = "https://stackwish.com/v1/login.php"
    
    //the defaultvalues to store user data
    let defaultValues = UserDefaults.standard

    @IBOutlet weak var emailTxt: UITextField!
    @IBOutlet weak var passwordTxt: UITextField!
    
    @IBOutlet weak var labelError: UITextField!
    
    @IBOutlet weak var acitivityIndicator: UIActivityIndicatorView!
    @IBAction func forgotPassClicked(_ sender: Any) {
    }
    
    @IBAction func backToStore(_ sender: Any) {
        presentMainController()
    }
    
    @IBAction func backToStoreAsAGuest(_ sender: Any) {
        presentMainController()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("*************  \(String(describing: defaultValues.string(forKey: "username")))")
        
        if defaultValues.string(forKey: "username") != nil{
            let storyBoard = UIStoryboard(name: "Main", bundle: nil)
            let controller = storyBoard.instantiateViewController(withIdentifier: "LoggedUser")
            present(controller, animated: true, completion: nil)
            
        }
    }
    
    @IBAction func loginClicked(_ sender: Any) {
//        guard let email = emailTxt.text , email.isNotEmpty,
//            let password = passwordTxt.text , password.isNotEmpty else {return}
//
//        acitivityIndicator.startAnimating()
//        Auth.auth().signIn(withEmail: email, password: password) {(user, error) in
//            if let error = error {
//                debugPrint(error)
//                self.acitivityIndicator.stopAnimating()
//                return
//            }
//            self.acitivityIndicator.stopAnimating()
//            self.dismiss(animated: true, completion: nil)
//
//        }
        let parameters: Parameters=[
            "username":emailTxt.text!,
            "password":passwordTxt.text!
        ]
        
        //making a post request
        Alamofire.request(URL_USER_LOGIN, method: .post, parameters: parameters).responseJSON
            {
                response in
                //printing response
                print("*************  \(response)")
                
                //getting the json value from the server
                if let result = response.result.value {
                    let jsonData = result as! NSDictionary
                    
                    //if there is no error
                    if(!(jsonData.value(forKey: "error") as! Bool)){
                        self.labelError.text = ""
                        
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
                        self.labelError.text = "Invalid username or password"
                    }
                }
        }
    }
    
    fileprivate func presentMainController(){
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyBoard.instantiateViewController(withIdentifier: "tabView")
        present(controller, animated: true, completion: nil)
    }
}
