//
//  HistoryTableViewController.swift
//  EmoticonApp
//
//  Created by Hochang Lee on 2021/01/20.
//

import UIKit

class CartViewController: UITableViewController {

    private var cart : CartProtocol = HistoryCart.getHistoryCart()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setNavigationItem()
        
        tableView.delegate = self
        tableView.dataSource = self
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cart.count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return tableView.frame.height/18
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CartCell") as! CartCell
        let row = indexPath.row
        cell.setHistory(history: cart.getHistory(index: row))
        return cell
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            cart.deleteHistory(index : indexPath.row)
            tableView.reloadData()
        }
    }
    
    func setNavigationItem() {
        let item = UIBarButtonItem(title: "Clear", style: .plain, target: self, action: #selector(clearButtonTouched))
        navigationItem.setRightBarButton(item, animated: true)
        navigationItem.title = "History"
    }
    
    @objc func clearButtonTouched() {
        cart.clearHistory()
        tableView.reloadData()
    }

}
