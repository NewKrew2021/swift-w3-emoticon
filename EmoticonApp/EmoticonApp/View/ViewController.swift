//
//  ViewController.swift
//  EmoticonApp
//
//  Created by 이청원 on 2021/01/18.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var topViewText: UILabel!
    @IBOutlet weak var emoticonTable: UITableView!
    private let emoticon = Emoticon()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        topView.backgroundColor = UIColor(patternImage: UIImage(named: "pattern") ?? UIImage())
        topViewText.text = "친구 추가하면\n겨울맞이\n이모티콘 선물!"
        topViewText.sizeToFit()
        
        emoticonTable.delegate = self
        emoticonTable.dataSource = self
        emoticonTable.rowHeight = 50
    }

}

extension ViewController : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = emoticonTable.dequeueReusableCell(withIdentifier: "emoticonTableCell", for: indexPath) as! EmoticonTableViewCell
        
        cell.title.text = emoticon.title(index: indexPath.row)
        cell.author.text = emoticon.author(index: indexPath.row)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.emoticon.size()
    }
}
