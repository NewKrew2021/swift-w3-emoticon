//
//  HistoryViewController.swift
//  EmoticonApp
//
//  Created by 지현우 on 2021/01/19.
//

import UIKit

class HistoryViewController: UIViewController {
    private let historyCellName = "HistoryTableViewCell"

    private var tableView: UITableView = {
        let view = UITableView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()

    private var clearBarButton: UIBarButtonItem = {
        let button = UIBarButtonItem()
        button.title = "Clear"
        button.style = .plain
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        initNavigationBar()
        initTableView()
        addTableView()
    }

    private func initNavigationBar() {
        title = "히스토리"
        clearBarButton.target = self
        clearBarButton.action = #selector(tappedClear)
        navigationItem.rightBarButtonItem = clearBarButton
    }

    private func initTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        let nibName_History = UINib(nibName: historyCellName, bundle: nil)
        tableView.register(nibName_History, forCellReuseIdentifier: historyCellName)
        tableView.separatorStyle = .none
        tableView.allowsSelection = false
    }

    private func addTableView() {
        view.addSubview(tableView)
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0).isActive = true
        tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
    }

    @objc private func tappedClear() {
        showAlert(style: .alert, title: "삭제", message: "모든 구매내역을 삭제하시겠습니까?", confirm: nil, destructive: "삭제") { [weak self] in
            guard let self = self else { return }
            Cart.removeAll()
            self.tableView.reloadData()
        }
    }
}

extension HistoryViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Cart.count
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: historyCellName, for: indexPath) as? HistoryTableViewCell else { return UITableViewCell() }

        cell.titleLabel.text = Cart[indexPath.row].title
        cell.dateLabel.text = Cart[indexPath.row].date.description

        return cell
    }
}
