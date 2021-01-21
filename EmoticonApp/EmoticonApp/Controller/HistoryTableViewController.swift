//
//  HistoryTableViewController.swift
//  EmoticonApp
//
//  Created by Hochang Lee on 2021/01/20.
//

import UIKit

class HistoryTableViewController: UITableViewController {

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
        return Histories.count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return tableView.frame.height/18
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CartCell") as! CartCell
        let row = indexPath.row
        cell.setHistory(history: Histories.getHistory(index: row))
        return cell
    }

    func setNavigationItem() {
        let item = UIBarButtonItem(title: "Clear", style: .plain, target: self, action: #selector(clearButtonTouched))
        navigationItem.setRightBarButton(item, animated: true)
        navigationItem.title = "History"
    }
    
    @objc func clearButtonTouched() {
        Histories.clearHistory()
        tableView.reloadData()
    }

}
