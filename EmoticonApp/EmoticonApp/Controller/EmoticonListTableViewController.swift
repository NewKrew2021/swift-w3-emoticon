//
//  TableViewController.swift
//  EmoticonApp
//
//  Created by Hochang Lee on 2021/01/18.
//

import UIKit

class EmoticonListTableViewController: UIViewController {

    private var cart : CartProtocol = HistoryCart.getHistoryCart()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cart.restoreHistories()
        
        setTableViewConstraints()
        tableView.delegate = self
        tableView.dataSource = self

        Emoticons.registerEmoticons()
        NotificationCenter.default.addObserver(self, selector: #selector(addHistory(_:)), name: .buyButtonTouched, object: nil)
    }
    

    @objc func addHistory(_ notification : Notification) {
        guard let history = notification.userInfo?["history"] as? History else { return }
        cart.addHistory(history: history)
    }
    
    func setTableViewConstraints() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        tableView.tableFooterView = UIView()
    }
    
}

extension EmoticonListTableViewController : UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Emoticons.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell") as! MyCell
        let row = indexPath.row
        cell.setEmoticon(emoticon : Emoticons.getEmoticon(index: row))
        cell.setConstraints()
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return tableView.frame.height/6
    }
    
}

