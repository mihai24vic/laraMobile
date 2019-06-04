//
//  ProductDetailVC.swift
//  Artable
//
//  Created by Mike on 03/06/2019.
//  Copyright © 2019 MikeComp. All rights reserved.
//

import UIKit
import Kingfisher

class ProductDetailVC: UIViewController {

    //Outlets
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var productTitle: UILabel!
    @IBOutlet weak var productPrice: UILabel!
    @IBOutlet weak var productDescription: UILabel!
    
    var product : Product!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        productTitle.text = product.name
        productDescription.text = product.productDescription
        
        if let url = URL(string: product.imageURL){
            productImage.kf.setImage(with: url)
        }
        
        let formatter =  NumberFormatter()
        
        formatter.numberStyle = .currency
        
        if let price = formatter.string(from: product.price as NSNumber){
            productPrice.text = price
        }
        
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(continueShoppingClicked(_:)))
        tap.numberOfTapsRequired = 1
        bgView.addGestureRecognizer(tap)
        // Do any additional setup after loading the view.
    }
    
    @objc func dismissProduct(){
        dismiss(animated: true, completion: nil)
    }

    @IBAction func addCartClicked(_ sender: Any) {
        //add product to cart
    }
    
    @IBAction func continueShoppingClicked(_ sender: Any) {
        dismiss(animated: true, completion:nil)
    }
    
    @IBOutlet weak var bgView: UIVisualEffectView!
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
