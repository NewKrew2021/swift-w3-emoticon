//
//  ViewController.swift
//  EmoticonApp
//
//  Created by 지현우 on 2021/01/18.
//

import UIKit

class EmoticonViewController: UIViewController {
    var tableView: UITableView = {
        let view = UITableView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "이모티콘"
        addTableView()
        initTableView()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }

    private func addTableView(){
        view.addSubview(tableView)
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0).isActive = true
        tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
    }
    
    private func initTableView() {
        print(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        let nibName_Emoticon = UINib(nibName: "EmoticonTableViewCell", bundle: nil)
        tableView.register(nibName_Emoticon, forCellReuseIdentifier: "emoticonTVCell")
        tableView.register(UINib(nibName: "EmoticonHeaderCell", bundle: nil), forHeaderFooterViewReuseIdentifier: "EmoticonHeaderCell")
        tableView.separatorStyle = .none
    }
}

extension EmoticonViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Emoticon.samples.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "emoticonTVCell", for: indexPath) as? EmoticonTableViewCell else {
            return UITableViewCell()
        }
        cell.titleLabel.text = Emoticon.samples[indexPath.row]["title"]
        cell.subTitleLabel.text = Emoticon.samples[indexPath.row]["author"]
        return cell
    }

    // 헤더 뷰 생성
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: "EmoticonHeaderCell") as? EmoticonHeaderCell else { return UIView() }
        return header
    }

    // 헤더 뷰 높이 설정
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return CGFloat(200)
    }
}
