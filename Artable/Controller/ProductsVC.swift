//
//  ProductsVC.swift
//  Artable
//
//  Created by Mike on 13/05/2019.
//  Copyright © 2019 MikeComp. All rights reserved.
//

import UIKit
import FirebaseFirestore

class ProductsVC: UIViewController {

    //Outlets
    @IBOutlet weak var tableView: UITableView!
    
    //Variables
    var products = [Product]()
    var category: Category!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let product = Product.init(name: "IOS APP", id: "hgvkhgf", category: "Applications", price: 33, productDescription: "Someting nice to do in the weekends", imageURL: "https://images.unsplash.com/photo-1514873684739-6847b4301185?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1328&q=80", timesStamp: Timestamp(), stock: 0, favorite: false)
        
        products.append(product)
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: Identifiers.ProductCell, bundle: nil), forCellReuseIdentifier: Identifiers.ProductCell)
        

        // Do any additional setup after loading the view.
    }
    

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
