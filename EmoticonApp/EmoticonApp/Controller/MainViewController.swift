//
//  ViewController.swift
//  EmoticonApp
//
//  Created by 윤준수 on 2021/01/18.
//

import UIKit

class MainViewController: UIViewController {
    
    private let eventMainText: UILabel = UILabel()
    private let eventTitle: UILabel = UILabel()
    private var mainImage: UIView = UIView()
    private let subImage: UIImageView = UIImageView()
    
    @IBOutlet weak var emoticonList: UITableView!
    
    private let emoticonService: EmoticonService = EmoticonService.instance
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initView()
    }
    func initView() {
        initMainImage()
        initTableView()
    }
    
    func initMainImage() {
        view.addSubview(mainImage)
        mainImage.translatesAutoresizingMaskIntoConstraints = false
        mainImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 15).isActive = true
        mainImage.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        mainImage.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -30).isActive = true
        mainImage.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.2).isActive = true
        guard let patternImgage = UIImage(named: "pattern") else { return }
        mainImage.backgroundColor = UIColor(patternImage: patternImgage)
        
        initTitle()
        initMainText()
        initSubImage()
    }
    
    func initTitle() {
        mainImage.addSubview(eventTitle)
        eventTitle.translatesAutoresizingMaskIntoConstraints = false
        eventTitle.leadingAnchor.constraint(equalTo: mainImage.leadingAnchor, constant: 3).isActive = true
        eventTitle.topAnchor.constraint(equalTo: mainImage.topAnchor, constant: 3).isActive = true
        eventTitle.text = "이벤트"
        eventTitle.textColor = .systemBlue
        eventTitle.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        eventTitle.sizeToFit()
    }
    
    func initMainText() {
        mainImage.addSubview(eventMainText)
        eventMainText.translatesAutoresizingMaskIntoConstraints = false
        eventMainText.leadingAnchor.constraint(equalTo: eventTitle.leadingAnchor).isActive = true
        eventMainText.centerYAnchor.constraint(equalTo: mainImage.centerYAnchor).isActive = true
        eventMainText.widthAnchor.constraint(equalTo: mainImage.widthAnchor, multiplier: 0.4).isActive = true
        eventMainText.text = "친구 추가하면 겨울맞이 이모티콘 선물!"
        eventMainText.font = UIFont.systemFont(ofSize: 24)
        eventMainText.numberOfLines = 0
        eventMainText.sizeToFit()
        eventMainText.lineBreakStrategy = .hangulWordPriority
    }
    
    func initSubImage() {
        mainImage.addSubview(subImage)
        subImage.translatesAutoresizingMaskIntoConstraints = false
        subImage.trailingAnchor.constraint(equalTo: mainImage.trailingAnchor).isActive = true
        subImage.bottomAnchor.constraint(equalTo: mainImage.bottomAnchor).isActive = true
        subImage.widthAnchor.constraint(equalTo: mainImage.widthAnchor, multiplier: 0.5).isActive = true
        subImage.heightAnchor.constraint(equalTo: mainImage.heightAnchor, multiplier: 0.9).isActive = true
        subImage.image = UIImage(named: "basket")
        subImage.contentMode = .scaleAspectFit
    }
    
    func initTableView() {
        view.addSubview(emoticonList)
        emoticonList.rowHeight = 80
        emoticonList.translatesAutoresizingMaskIntoConstraints = false
        emoticonList.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        emoticonList.topAnchor.constraint(equalTo: mainImage.bottomAnchor, constant: 10).isActive = true
        emoticonList.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        emoticonList.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
    }
}

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return emoticonService.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "emoticonCell", for: indexPath) as! EmoticonCell//!를 없앨 방법 고민해보자
        let emoticon = emoticonService.getEmoticon(at: indexPath.row)
        cell.setCell(emoticon: emoticon)
        return cell
    }
}
