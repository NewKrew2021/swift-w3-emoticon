//
//  ViewController.swift
//  EmoticonApp
//
//  Created by 윤준수 on 2021/01/18.
//

import UIKit

class MainViewController: UIViewController {
    

    @IBOutlet weak var emoticonList: UITableView!
    
    private let emoticonService: EmoticonService = EmoticonService.instance
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return emoticonService.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "emoticonCell", for: indexPath) as! EmoticonCell//!를 없앨 방법 고민해보자
        let emoticon = emoticonService.emoticons[indexPath.row]
        cell.thumbnail = UIImage(named: emoticon.image)
        cell.title = emoticon.title
        cell.author = emoticon.author
        return cell
    }
}
