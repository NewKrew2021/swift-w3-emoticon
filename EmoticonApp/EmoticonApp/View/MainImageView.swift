//
//  selfView.swift
//  EmoticonApp
//
//  Created by 윤준수 on 2021/01/20.
//

import UIKit

class MainImageView: UIView {
    private let eventMainText: UILabel = UILabel()
    private let eventTitle: UILabel = UILabel()
    private let subImage: UIImageView = UIImageView()

    
    func initself() {
        initTitle()
        initMainText()
        initSubImage()
    }
    
    func initTitle() {
        self.addSubview(eventTitle)
        eventTitle.translatesAutoresizingMaskIntoConstraints = false
        eventTitle.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 3).isActive = true
        eventTitle.topAnchor.constraint(equalTo: self.topAnchor, constant: 3).isActive = true
        eventTitle.text = "이벤트"
        eventTitle.textColor = .systemBlue
        eventTitle.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        eventTitle.sizeToFit()
    }
    
    func initMainText() {
        self.addSubview(eventMainText)
        eventMainText.translatesAutoresizingMaskIntoConstraints = false
        eventMainText.leadingAnchor.constraint(equalTo: eventTitle.leadingAnchor).isActive = true
        eventMainText.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        eventMainText.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.4).isActive = true
        eventMainText.text = "친구 추가하면 겨울맞이 이모티콘 선물!"
        eventMainText.font = UIFont.systemFont(ofSize: 24)
        eventMainText.numberOfLines = 0
        eventMainText.sizeToFit()
        eventMainText.lineBreakStrategy = .hangulWordPriority
    }
    
    func initSubImage() {
        self.addSubview(subImage)
        subImage.translatesAutoresizingMaskIntoConstraints = false
        subImage.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        subImage.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        subImage.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.5).isActive = true
        subImage.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.9).isActive = true
        subImage.image = UIImage(named: "basket")
        subImage.contentMode = .scaleAspectFit
    }

}
