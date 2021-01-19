//
//  ViewController.swift
//  EmoticonApp
//
//  Created by 지현우 on 2021/01/18.
//

import UIKit

class EmoticonViewController: UIViewController {
    private let emoticonCellName = "EmoticonTableViewCell"
    private let emoticonHeaderName = "EmoticonHeaderCell"

    private var tableView: UITableView = {
        let view = UITableView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()

    private var shopBarButton: UIBarButtonItem = {
        let button = UIBarButtonItem()
        button.image = UIImage(systemName: "cart.fill")
        button.style = .plain
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        addTableView()
        initTableView()
        initNavigationBar()
    }

    private func initNavigationBar() {
        title = "이모티콘"
        shopBarButton.action = #selector(tappedCart)
        navigationItem.rightBarButtonItem = shopBarButton
    }

    private func addTableView() {
        view.addSubview(tableView)
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0).isActive = true
        tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
    }

    private func initTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        let nibName_Emoticon = UINib(nibName: emoticonCellName, bundle: nil)
        tableView.register(nibName_Emoticon, forCellReuseIdentifier: emoticonCellName)
        tableView.register(UINib(nibName: emoticonHeaderName, bundle: nil), forHeaderFooterViewReuseIdentifier: emoticonHeaderName)
        tableView.separatorStyle = .none
    }
    
    @objc private func tappedCart(){
        let historyVC = HistoryViewController()
        
        self.navigationController?.pushViewController(historyVC, animated: true)
        
    }
}

extension EmoticonViewController: UITableViewDelegate, UITableViewDataSource {
    // 셀의 갯수
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Shop.count
    }

    // 셀의 높이
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }

    // 셀이 어떻게 표현될 것인가?
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "EmoticonTableViewCell", for: indexPath) as? EmoticonTableViewCell else {
            return UITableViewCell()
        }
        cell.titleLabel.text = Shop[indexPath.row]["title"]
        cell.subTitleLabel.text = Shop[indexPath.row]["author"]
        cell.imgView.image = UIImage(named: Shop[indexPath.row]["image"] ?? "") ?? UIImage()
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
