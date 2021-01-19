//
//  MainViewController.swift
//  EmoticonApp
//
//  Created by bean Milky on 2021/01/18.
//

import UIKit

class MainViewController: UIViewController {

    private var mainImage: UIView!
    private var myTableView: UITableView!
    let screenWidth = UIScreen.main.bounds.size.width
    let screenHeight = UIScreen.main.bounds.size.height
    var emojiData: EmojiList?
    var cellHeight: CGFloat = CGFloat(100)
    let numOfCell: CGFloat = 6.5
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = false
        setUI()
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

    private func getEmojiData() {
        let data = [
              [ "title": "유년기오구의 쪼꼬만 일상", "author": "문랩", "image": "image01.png" ],
              [ "title": "콩글리시 이즈 꿀잼2", "author": "노페이퍼", "image": "image02.png" ],
              [ "title": "진짜 찐?", "author": "mohe", "image": "image03.png" ],
              [ "title": "바다 갈매기 매봉이는 여유로워", "author": "이우산", "image": "image04.png" ],
              [ "title": "공하 3 (공주하이)", "author": "봉이봉봉봉", "image": "image05.png" ],
              [ "title": "무새무새의 몸짓들", "author": "SO", "image": "image06.png" ],
              [ "title": "열심히 산다 빠릿빠릿 곰", "author": "HIPUP PLANET", "image": "image07.png" ],
              [ "title": "반전! 주접콘", "author": "잼잼", "image": "image08.png" ],
              [ "title": "3단티콘", "author": "나그", "image": "image09.png" ],
              [ "title": "넌 나의 비타민~", "author": "무릎이 임선경", "image": "image10.png" ],
              [ "title": "하찮은 외계인 밍찡", "author": "라밍", "image": "image11.png" ],
              [ "title": "안녕! 아기 보노보노", "author": "보노보노", "image": "image12.png" ]
              ]
        emojiData = EmojiList(list: data.map { return Emoji(title: $0["title"] ?? "", author: $0["author"] ?? "", image: $0["image"] ?? "default") })
    }

    private func setTableView() {
        getEmojiData()
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
}

extension MainViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    // to-do: buy emoji item
  }
}

extension MainViewController: UITableViewDataSource {
  
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return emojiData?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return cellHeight
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell: EmojiTableViewCell = tableView.dequeueReusableCell(withIdentifier: EmojiTableViewCell.cellIdentifier, for: indexPath) as? EmojiTableViewCell {
            cell.emoji?.image = UIImage(named: emojiData?[indexPath.row].property["image"] ?? "default")
            cell.emojiName?.text = emojiData?[indexPath.row].property["title"] ?? ""
            cell.emojiDescription?.text = emojiData?[indexPath.row].property["author"] ?? ""
            cell.selectionStyle = .none
            cell.setHeight(height: cellHeight)
            return cell
        }
        return UITableViewCell()
    }
}
