//
//  MainCustomCell.swift
//  EmoticonApp
//
//  Created by bean Milky on 2021/01/19.
//

import UIKit

class EmojiTableViewCell: UITableViewCell {

    static let cellIdentifier = "MainTableViewCell"
    var emoji: UIImageView?
    var emojiName: UILabel?
    var emojiDescription: UILabel?

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUI()
        addContentView()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setUI()
        addContentView()
    }

    private func setUI() {
        emoji = UIImageView()
        emoji?.contentMode = .scaleAspectFit
        emojiName = UILabel()
        emojiName?.font = UIFont.boldSystemFont(ofSize: 20)
        emojiDescription = UILabel()
        emojiDescription?.font = UIFont.boldSystemFont(ofSize: 15)
    }
    
    func setHeight(height: CGFloat) {
        emoji?.frame.size = CGSize(width: height, height: height)
        emojiName?.frame.size.height = height / 2
        emojiDescription?.frame.size.height = height / 2
        emojiName?.frame.origin = CGPoint(x: height, y: 0)
        emojiName?.frame.size = CGSize(width: self.frame.width-height, height: height / 2)
        emojiDescription?.frame.origin = CGPoint(x: height, y: height/2)
        emojiDescription?.frame.size = CGSize(width: self.frame.width-height, height: height / 2)

    }
    
    private func addContentView() {
        if let imageView = emoji {
            contentView.addSubview(imageView)
        }
        if let label = emojiName {
            contentView.addSubview(label)
        }
        if let label = emojiDescription {
            contentView.addSubview(label)
        }
    }
}
