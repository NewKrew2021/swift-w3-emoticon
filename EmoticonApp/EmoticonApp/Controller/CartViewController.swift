//
//  CartViewController.swift
//  EmoticonApp
//
//  Created by 윤준수 on 2021/01/20.
//

import UIKit

class CartViewController: UITableViewController {
    
    private var cartService: CartService?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(cartsChanged(_:)), name: .cartsChanged, object: nil)
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cartService?.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CartCell", for: indexPath) as! CartCell
        guard let product = cartService?[indexPath.row] else { return cell }
        cell.setCell(product: product)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            cartService?.removeProduct(at: indexPath.row)
        }
    }
    
    func setCartService(cartService: CartService) {
        self.cartService = cartService
    }
    
    @IBAction func clearCart(_ sender: Any) {
        cartService?.removeAll()
    }
    
    @objc func cartsChanged(_ notification: Notification) {
        tableView.reloadData()
    }
}

extension Notification.Name {
    static let cartsChanged = Notification.Name("cartsChanged")
}
