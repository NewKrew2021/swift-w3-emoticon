//
//  HistoryViewController.swift
//  EmoticonApp
//
//  Created by bean Milky on 2021/01/20.
//

import UIKit

class HistoryViewController: UITableViewController {

    init() {
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "History"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Clear", style: .plain, target: self, action: #selector(clear))
    }

    @objc func clear() {
        print("clear")
    }

}
