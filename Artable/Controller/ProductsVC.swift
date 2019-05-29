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

class ProductsVC: UIViewController {

    //Outlets
    @IBOutlet weak var tableView: UITableView!
    
    //Variables
    var products = [Product]()
    var category: Category!
    let LARA_URL = "http://stackwish.com/api.php/table=tbl_products"
    let params = ["table":"tbl_products"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let product = Product.init(name: "IOS APP", id: "hgvkhgf", category: "Applications", price: 33, productDescription: "Someting nice to do in the weekends", imageURL: "https://images.unsplash.com/photo-1514873684739-6847b4301185?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1328&q=80", timesStamp: Timestamp(), stock: 0, favorite: false)
 
        
        products.append(product)
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: Identifiers.ProductCell, bundle: nil), forCellReuseIdentifier: Identifiers.ProductCell)
        
        getProductsData(url: LARA_URL, parameters : params)
        // Do any additional setup after loading the view.
    }
    
    
    func getProductsData(url : String, parameters : [String:Any]){
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
        
        for (key, value ) in json {
            let product = Product.init(name: "\(value["name_prd"])", id: "hgvkhgf", category: "Applications", price: Double("\(value["pret_sortare"])")!, productDescription: "Someting nice to do in the weekends", imageURL: "https://images.unsplash.com/photo-1514873684739-6847b4301185?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1328&q=80", timesStamp: Timestamp(), stock: 0, favorite: false)
            
            self.products.append(product)
        }
        
        
        
        //print("\(json[22]["name_prd"]) *************************")
        
        self.tableView.reloadData()
        //tableView.delegate = self
        //tableView.dataSource = self
        //tableView.register(UINib(nibName: Identifiers.ProductCell, bundle: nil), forCellReuseIdentifier: Identifiers.ProductCell)
        
        //let prod = Product.init(name: "\(json[1]["name_prd"])", id: "\(json[1]["id_prd"])", category: "Home", price: Double("\(json[1]["pret_sortare"])")!, productDescription: "bau", imageURL: "\(json[1]["name_prd"])", timesStamp: Timestamp(), stock: 33, favorite: false)
        print("PRODUCTS*")
    }
    
    //func fetchProductData(){
        
    //}

}


extension ProductsVC : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: Identifiers.ProductCell, for: indexPath) as? ProductCell {
            cell.configureCell(product: products[indexPath.row])
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
}
