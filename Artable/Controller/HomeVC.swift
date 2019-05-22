//
//  ViewController.swift
//  Artable
//
//  Created by Mike on 22/04/2019.
//  Copyright © 2019 MikeComp. All rights reserved.
//
import Foundation
import UIKit
import Firebase

class HomeVC: UIViewController {

    //Outlets
    
    @IBOutlet weak var loginOutBtn: UIBarButtonItem!
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    //variables
    var categegories = [Category]()
    var selectedCategory : Category!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let category =  Category.init(name: "nature", id: "sdafas", imagUrl:"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTSyR4mVKtGxzE-wYnL01KLLq1E-X0nb9O2wRo2kKXqeQG4dWvs", isActive: true, timeStamp: Timestamp())
        
        categegories.append(category)
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: Identifiers.CategoryCell, bundle: nil), forCellWithReuseIdentifier: Identifiers.CategoryCell)
        // Do any additional setup after loading the view.
        if Auth.auth().currentUser == nil {
            Auth.auth().signInAnonymously{
                (result, error) in if let error = error {
                    debugPrint(error)
                }
            }
        }

    }

    override func viewDidAppear(_ animated: Bool) {
        
    }
    @IBAction func loginOutCliked(_ sender: Any) {
        if let _ = Auth.auth().currentUser{
            //we are logged in
            loginOutBtn.title = "Logout"
            do {
                //try Auth.auth().signOut()
                presentLoginController()
            }catch{
                debugPrint(error.localizedDescription)
            }
        }else{
            loginOutBtn.title = "Log In"
            presentLoginController()
        }
    }
    
    fileprivate func presentLoginController(){
        let storyBoard = UIStoryboard(name: "LoginStoryBoard", bundle: nil)
        let controller = storyBoard.instantiateViewController(withIdentifier: "logingVC")
        present(controller, animated: true, completion: nil)
    }
    

}

extension HomeVC : UICollectionViewDelegate, UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
      return categegories.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Identifiers.CategoryCell, for: indexPath) as? CategoryCell{
            cell.configureCell(category: categegories[indexPath.item])
            return cell
            
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, sizeForItemAt indexPath: IndexPath)  -> CGSize {
        let width = view.frame.width
        let celwidth = (width - 50) / 2
        let cellHeight = celwidth * 1.5
        
        return CGSize(width: celwidth, height: cellHeight)
    }
    
    func collectionView(_ collectionView : UICollectionView, didSelectItemAt indexPath: IndexPath){
        selectedCategory = categegories[indexPath.item]
        performSegue(withIdentifier: Segues.ToProducts, sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == Segues.ToProducts{
            
            if let destination = segue.destination as? ProductsVC {
                destination.category = selectedCategory
            }
        }
    }
    
}
