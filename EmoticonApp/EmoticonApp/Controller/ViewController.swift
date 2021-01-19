//
//  ViewController.swift
//  EmoticonApp
//
//  Created by 윤준수 on 2021/01/18.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var eventTitle: UILabel!
    @IBOutlet weak var upperView: UIView!
    @IBOutlet weak var emoticonList: UITableView!
    
    override func loadView() {
        super.loadView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let patternImgage = UIImage(named: "pattern"){
            upperView.backgroundColor = UIColor(patternImage: patternImgage)
        }
        
        eventTitle.lineBreakStrategy = .hangulWordPriority
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Emoticon.list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "emoticonCell", for: indexPath) as! EmoticonCell//!를 없앨 방법 고민해보자
        cell.title.text = Emoticon.list[indexPath.row]["title"]
        cell.author.text = Emoticon.list[indexPath.row]["author"]
        return cell
    }
    
}
