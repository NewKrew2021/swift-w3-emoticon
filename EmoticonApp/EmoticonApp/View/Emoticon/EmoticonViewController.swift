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
    private var cart = Cart.shared
    private let shop = Shop.shared

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
        NotificationCenter.default.addObserver(self, selector: #selector(buyEmoticon), name: .buyEmoticon, object: nil)
    }

    private func initNavigationBar() {
        title = "이모티콘"
        shopBarButton.target = self
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
        tableView.allowsSelection = false
    }

    @objc private func tappedCart() {
        let historyVC = HistoryViewController()
        navigationController?.pushViewController(historyVC, animated: true)
    }

    @objc private func buyEmoticon(_ notification: Notification) {
        guard let data = notification.object as? History else { return }
        showAlert(style: .alert, title: "구매", message: "\"\(data.title)\" 이모티콘을 구매하시겠습니가?", confirm: "네", cancel: "아니오", destructive: nil) { [weak self] in
            guard let self = self else { return }
            self.cart.buyEmoticon(title: data.title, date: data.date)
        }
    }

    deinit {
        NotificationCenter.default.removeObserver(self, name: .buyEmoticon, object: nil)
    }
}

extension EmoticonViewController: UITableViewDelegate, UITableViewDataSource {
    // 셀의 갯수
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return shop.count
    }

    // 셀이 어떻게 표현될 것인가?
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "EmoticonTableViewCell", for: indexPath) as? EmoticonTableViewCell else {
            return UITableViewCell()
        }
        let emoticon = shop[indexPath.row]
        cell.titleLabel.text = emoticon.title
        cell.subTitleLabel.text = emoticon.author
        cell.imgView.image = UIImage(named: emoticon.imagePath)
        return cell
    }

    // 헤더 뷰가 어떻게 표현될 것인가?
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: "EmoticonHeaderCell") as? EmoticonHeaderCell else { return UIView() }
        return header
    }

    // 셀의 높이
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }

    // 헤더 뷰 높이 설정
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return CGFloat(200)
    }
}
