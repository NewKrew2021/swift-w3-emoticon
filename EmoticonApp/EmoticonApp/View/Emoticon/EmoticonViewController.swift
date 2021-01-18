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
    }
}

extension EmoticonViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}
