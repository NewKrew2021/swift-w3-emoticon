//
//  MainViewController.swift
//  EmoticonApp
//
//  Created by bean Milky on 2021/01/18.
//

import UIKit

class MainViewController: UIViewController, UITableViewDelegate {

    private var mainImage: UIView!
    private var myTableView: UITableView!
    let screenWidth = UIScreen.main.bounds.size.width
    let screenHeight = UIScreen.main.bounds.size.height
    private var emojiService: EmojiService = EmojiService()
    private let emojiList: EmojiListModel
    private var cart: Cart = Cart()
    private var clickedItemId: String?
    private var cellHeight: CGFloat = CGFloat(100)
    private let numOfCell: CGFloat = 6.5
    private var alert: UIAlertController
    
    init() {
        emojiList = emojiService.data
        alert = UIAlertController(title: "알림", message: "구매하시겠습니까?", preferredStyle: .alert)
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        emojiList = emojiService.data
        alert = UIAlertController(title: "알림", message: "구매하시겠습니까?", preferredStyle: .alert)
        super.init(coder: coder)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = false
        setUI()
        let okHandler: (UIAlertAction) -> Void = { [weak self] _ in
            guard let stringSelf = self else { return }
            if let id = stringSelf.clickedItemId {
                stringSelf.clickAlertOK(id: id)
            }
        }
        alert.addAction(UIAlertAction(title: "확인", style: .default, handler: okHandler))
        alert.addAction(UIAlertAction(title: "취소", style: .default, handler: nil))
    }

    private func setUI() {
        setMainImage()
        setTableView()
    }
    private func setMainImage() {
        self.mainImage = Promotion(frame: CGRect(x: 0, y: self.topbarHeight, width: screenWidth-20, height: 230))
        self.view.addSubview(mainImage)
        self.mainImage.center.x = self.view.center.x
    }

    private func setTableView() {
        let positionY = self.topbarHeight+mainImage.frame.height+20
        self.myTableView = UITableView(frame: CGRect(x: 0, y: positionY, width: self.screenWidth, height: self.screenHeight-positionY))

        myTableView.alwaysBounceVertical = false
        myTableView.showsVerticalScrollIndicator = false
        myTableView.dataSource = self
        myTableView.delegate = self
        myTableView.register(EmojiTableViewCell.self, forCellReuseIdentifier: EmojiTableViewCell.cellIdentifier)
        view.addSubview(self.myTableView)
        cellHeight = CGFloat((self.screenHeight-positionY)/numOfCell)
    }
    
    private func clickAlertOK(id: String) {
        if let emoji = emojiList.findById(id: id) {
            cart.push(emoji: emoji)
        }
    }
    
}

extension MainViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return emojiService.data.count
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return cellHeight
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell: EmojiTableViewCell = tableView.dequeueReusableCell(withIdentifier: EmojiTableViewCell.cellIdentifier, for: indexPath) as? EmojiTableViewCell {
            guard emojiList.count > indexPath.row else { return UITableViewCell() }
            let title = emojiList[indexPath.row].title
            let author = emojiList[indexPath.row].author
            let image = emojiList[indexPath.row].image
            let emojiId = emojiList[indexPath.row].id
            cell.delegate = self
            cell.setProperty(id: emojiId, title: title, author: author, imageName: image)
            cell.setHeight(height: cellHeight)
            cell.selectionStyle = .none
            return cell
        }
        return UITableViewCell()
    }
}

extension MainViewController: EmojiTableCellDelegate {
    func buttonTapped(id: String) {
        self.present(alert, animated: true, completion: nil)
        self.clickedItemId = id
    }
    
}
