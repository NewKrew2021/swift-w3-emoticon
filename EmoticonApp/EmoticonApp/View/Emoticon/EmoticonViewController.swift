//
//  ViewController.swift
//  EmoticonApp
//
//  Created by 지현우 on 2021/01/18.
//

import UIKit

class EmoticonViewController: UIViewController {
    @IBOutlet var tableView: UITableView!
    let nibName_Emoticon = UINib(nibName: "EmoticonTableViewCell", bundle: nil)

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(nibName_Emoticon, forCellReuseIdentifier: "emoticonTVCell")
        tableView.register(UINib(nibName: "EmoticonHeaderCell", bundle: nil), forHeaderFooterViewReuseIdentifier: "EmoticonHeaderCell")
        tableView.separatorStyle = .none
    }
    
    
}

extension EmoticonViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "emoticonCell", for: indexPath) as? EmoticonTableViewCell else {
            return UITableViewCell()
        }
        
        cell.titleLabel.text = Emoticon.samples[indexPath.row]["title"]
        cell.subTitleLabel.text = Emoticon.samples[indexPath.row]["author"]
        return UITableViewCell()
    }

    //헤더 뷰 생성
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: "EmoticonHeaderCell") as? EmoticonHeaderCell else {return UIView()}
        return header
    }
    
    //헤더 뷰 높이 설정
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return CGFloat(200)
    }
}
