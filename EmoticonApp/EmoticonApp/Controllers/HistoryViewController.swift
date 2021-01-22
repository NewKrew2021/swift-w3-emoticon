//
//  HistoryViewController.swift
//  EmoticonApp
//
//  Created by bean Milky on 2021/01/20.
//

import UIKit

class HistoryViewController: UITableViewController {

    var cart: CartType = Cart.shared
    private let cellIdentifier: String = "historyCell"
    let screenWidth = UIScreen.main.bounds.size.width
    let screenHeight = UIScreen.main.bounds.size.height
    private var cartObserver: Observable?

    init() {
        super.init(nibName: nil, bundle: nil)
        self.cartObserver = CartObserver(self)
        self.cartObserver?.addObserver(name: .clearCart, selector: #selector(reloadTable))
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.cartObserver = CartObserver(self)
        self.cartObserver?.addObserver(name: .clearCart, selector: #selector(reloadTable))
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationUI()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(HistoryTableViewCell.self, forCellReuseIdentifier: HistoryTableViewCell.cellIdentifier)
    }

    func setNavigationUI() {
        self.navigationItem.title = "History"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Clear", style: .plain, target: self, action: #selector(checkBeforeClear))
    }

    @objc func checkBeforeClear() {
        let okHandler: (UIAlertAction) -> Void = { [weak self] _ in
            guard let strongSelf = self else { return }
            strongSelf.cart.clear()
        }
        let alert: UIAlertController = UIAlertController(title: "알림", message: "모두 삭제하시겠습니까?", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "확인", style: .default, handler: okHandler))
        alert.addAction(UIAlertAction(title: "취소", style: .default, handler: nil))
        self.present(alert, animated: true)
    }

    @objc func reloadTable(_ notification: Notification) {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.cart.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell: HistoryTableViewCell = tableView.dequeueReusableCell(withIdentifier: HistoryTableViewCell.cellIdentifier, for: indexPath) as? HistoryTableViewCell {
            let cartItem = cart[indexPath.row] as CartItem
            cell.setProperty(cartItem: cartItem)
            cell.resize(width: screenWidth)
            return cell
        }
        return UITableViewCell()
    }
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            cart.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.automatic)
        }
    }

}
