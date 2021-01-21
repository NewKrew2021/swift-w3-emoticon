//
//  CartViewController.swift
//  EmoticonApp
//
//  Created by 윤준수 on 2021/01/20.
//

import UIKit

class CartViewController: UITableViewController {
    
    private let cartService: CartService = CartServiceImpl.instance
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cartService.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CartCell", for: indexPath) as! CartCell
        let product = cartService[indexPath.row]
        cell.setCell(product: product)
        return cell
    }
}
