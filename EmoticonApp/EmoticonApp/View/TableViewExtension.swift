//
//  MyTableView.swift
//  EmoticonApp
//
//  Created by Hochang Lee on 2021/01/20.
//

import UIKit

extension UITableView {
    func setTableView(superView : UIView) {
        
        translatesAutoresizingMaskIntoConstraints = false
        topAnchor.constraint(equalTo: superView.topAnchor).isActive = true
        bottomAnchor.constraint(equalTo: superView.bottomAnchor).isActive = true
        leadingAnchor.constraint(equalTo: superView.leadingAnchor).isActive = true
        trailingAnchor.constraint(equalTo: superView.trailingAnchor).isActive = true
        tableFooterView = UIView()
    }
    
    func assignDelegateAndDataSource(controller : EmoticonListTableViewController) {
        delegate = controller
        dataSource = controller
    }
}
