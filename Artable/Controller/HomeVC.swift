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

    
    //variables
    let defaultValues = UserDefaults.standard
    var categegories = [Category]()
    var selectedCategory : Category!

    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if defaultValues.string(forKey: "username") != nil {
            
            presentLoggedUserVC()
        }else{
            presentLoginController()
        }

    }

    override func viewDidAppear(_ animated: Bool) {
        
    }
    
    fileprivate func presentLoginController(){
        let storyBoard = UIStoryboard(name: "LoginStoryBoard", bundle: nil)
        let controller = storyBoard.instantiateViewController(withIdentifier: "LoginVC")
        present(controller, animated: true, completion: nil)
    }
    
    fileprivate func presentLoggedUserVC(){
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyBoard.instantiateViewController(withIdentifier: "LoggedUser")
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
