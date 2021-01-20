//
//  CartViewController.swift
//  EmoticonApp
//
//  Created by 이청원 on 2021/01/19.
//

import UIKit

class CartViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "History"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Clear", style: .plain, target: self, action: #selector(clickedClearButton))
        
        
    }
    
    @objc func clickedClearButton() {
        
    }
}
