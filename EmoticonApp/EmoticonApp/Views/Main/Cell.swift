//
//  MainCustomCell.swift
//  EmoticonApp
//
//  Created by bean Milky on 2021/01/19.
//

import UIKit

class EmojiTableViewCell: UITableViewCell {

    static let cellIdentifier = "MainTableViewCell"
    let emoji: UIImageView = {
        let emoji = UIImageView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        return emoji
    }()

    let emojiName: UILabel = {
        let emojiName = UILabel()
        emojiName.font = UIFont.boldSystemFont(ofSize: 20)
        return emojiName
    }()

    let emojiDescription: UILabel = {
        let emojiDescription = UILabel()
        emojiDescription.font = UIFont.boldSystemFont(ofSize: 20)
        return emojiDescription
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addContentView()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        addContentView()
    }

    private func addContentView() {
        contentView.addSubview(emoji)
        contentView.addSubview(emojiName)
        contentView.addSubview(emojiDescription)
    }
}
