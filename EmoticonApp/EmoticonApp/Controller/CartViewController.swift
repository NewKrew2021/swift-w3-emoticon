//
//  HistoryTableViewController.swift
//  EmoticonApp
//
//  Created by Hochang Lee on 2021/01/20.
//

import UIKit

class CartViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        setNavigationItem()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        NotificationCenter.default.addObserver(self, selector: #selector(historySwiped(_:)), name: .historySwiped, object: nil)
    }
    
    @objc func historySwiped(_ notification : Notification) {
        guard let info = notification.userInfo else { return }
        guard let title = info["title"] as? String else { return }
        guard let time = info["time"] as? String else { return }
        HistoryCart.deleteHistory(title: title, time: time)
        tableView.reloadData()
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return HistoryCart.count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return tableView.frame.height/18
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CartCell") as! CartCell
        let row = indexPath.row
        cell.setHistory(history: HistoryCart.getHistory(index: row))
        return cell
    }

    func setNavigationItem() {
        let item = UIBarButtonItem(title: "Clear", style: .plain, target: self, action: #selector(clearButtonTouched))
        navigationItem.setRightBarButton(item, animated: true)
        navigationItem.title = "History"
    }
    
    @objc func clearButtonTouched() {
        HistoryCart.clearHistory()
        tableView.reloadData()
    }

}
