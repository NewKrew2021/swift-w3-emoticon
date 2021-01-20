//
//  TableViewController.swift
//  EmoticonApp
//
//  Created by Hochang Lee on 2021/01/18.
//

import UIKit

class TableViewController: UIViewController {

    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.setTableView(superView: view)
        tableView.assignDelegateAndDataSource(controller: self)

        Emoticons.registerEmoticons()
    }
    

}

extension TableViewController : UITableViewDelegate, UITableViewDataSource {

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
