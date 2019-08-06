//
//  ProductsVC.swift
//  Artable
//
//  Created by Mike on 13/05/2019.
//  Copyright © 2019 MikeComp. All rights reserved.
//

import UIKit
import FirebaseFirestore
import Alamofire
import SwiftyJSON
import AVFoundation

class ProductsVC: UIViewController {

    //Outlets
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var menuButton: UIBarButtonItem!
    
    //Variables
    var products = [Product]()
    var category: Category!
    lazy var bulk_no : Int = 10
    
   
    
    var productImageUrl = "https://laramobile.ro/pics/264/3r.jpg"
   
    var params = ["table":"tbl_products"]

    override func viewDidLoad() {
        super.viewDidLoad()
        sideMenu()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: Identifiers.ProductCell, bundle: nil), forCellReuseIdentifier: Identifiers.ProductCell)
        
        getProductsData(bulk_no: 0, parameters : params)
        // Do any additional setup after loading the view.
    }
    
    
    func getProductsData(bulk_no : Int, parameters : [String:Any]){
        
       let url = "http://laramobile.com/api.php/table=tbl_products/offset=\(bulk_no)"
        
        print(url)
        
        Alamofire.request(url, method: .get, parameters: nil).responseJSON{
            response in
            if response.result.isSuccess{
                print("Success")
                let productJSON : JSON = JSON(response.result.value!)
                self.updateProductsWithData(json:productJSON)
            }
            else {
                print("The error \(String(describing: response.result.error))")
            }
            
        }
    }
    
    func updateProductsWithData(json : JSON ){
        
        for (_, value ) in json {
            
            let pictureArray = "\(value["poze"])"
            let pictureNumber = pictureArray.components(separatedBy: ",").first
            
            let product = Product.init(name: "\(value["name_prd"])", id: "\(value["id_prd"])", category: "Applications", price: Double("\(value["pret_sortare"])")!, productDescription: "\(value["short_description_prd"])", imageURL: "https://laramobile.ro/pics/\(value["id_prd"])/\(pictureNumber ?? "1")r.jpg", timesStamp: Timestamp(), stock: 0, favorite: false)
            self.products.append(product)
            
        }
        
        self.tableView.reloadData()
    }

}


extension ProductsVC : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: Identifiers.ProductCell, for: indexPath) as? ProductCell {
            cell.configureCell(product: products[indexPath.row])
            
            if indexPath.row >= bulk_no - 3 {
                print ("BULK: \(bulk_no)")
                bulk_no = bulk_no + 10;
                // call api

                getProductsData(bulk_no: bulk_no, parameters : params);
            }
            
            return cell
        }
        
      
        
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = ProductDetailVC()
        let selectedProduct = products[indexPath.row]
        vc.product = selectedProduct
        vc.modalTransitionStyle = .crossDissolve
        vc.modalPresentationStyle = .overCurrentContext
        present(vc, animated: true, completion: nil)
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    func sideMenu(){
        if revealViewController() != nil {
            menuButton.target = revealViewController()
            menuButton.action = #selector(SWRevealViewController.revealToggle(_:))
            revealViewController()?.rearViewRevealWidth = 280

            view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
   }
}
