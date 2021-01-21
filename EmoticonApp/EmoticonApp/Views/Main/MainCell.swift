//
//  MainCustomCell.swift
//  EmoticonApp
//
//  Created by bean Milky on 2021/01/19.
//

import UIKit

protocol EmojiTableCellDelegate: AnyObject {
    func didButtonTapped(id: UUID)
}

class EmojiTableViewCell: UITableViewCell {

    static let cellIdentifier = "MainTableViewCell"
    private var emojiId: UUID?
    private var emojiImageView: UIImageView = UIImageView()
    private var emojiName: UILabel = UILabel()
    private var emojiDescription: UILabel = UILabel()
    private var buy: UIButton = UIButton()
    weak var delegate: EmojiTableCellDelegate?

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
        emojiImageView.contentMode = .scaleAspectFit
        emojiName.font = UIFont.systemFont(ofSize: UIFont.labelFontSize, weight: .medium)
        emojiName.contentMode = .top
        emojiDescription.font = UIFont.systemFont(ofSize: UIFont.systemFontSize, weight: .light)
        emojiDescription.contentMode = .top
        buy.titleLabel?.font = UIFont.systemFont(ofSize: UIFont.systemFontSize, weight: .light)
        buy.setTitle("구매", for: .normal)
        buy.setTitleColor(UIColor.blue, for: .normal)
        buy.addTarget(self, action: #selector(buyTapped), for: .touchUpInside)
    }

    func setProperty(emoji: Emoji) {
        emojiId = emoji.id
        emojiName.text = emoji.title
        emojiDescription.text = emoji.author
        emojiImageView.image = UIImage(named: emoji.image)
    }

    func resize(width: CGFloat, height: CGFloat) {
        emojiImageView.frame.size = CGSize(width: height, height: height)
        buy.frame.size = CGSize(width: height, height: height)
        buy.frame.origin = CGPoint(x: self.frame.width-height, y: 0)
        emojiName.frame.origin = CGPoint(x: height, y: 0)
        emojiName.frame.size = CGSize(width: self.frame.width-height*2, height: height / 2)
        emojiDescription.frame.origin = CGPoint(x: height, y: height/2)
        emojiDescription.frame.size = CGSize(width: self.frame.width-height, height: height / 2)
    }

    private func addContentView() {
        contentView.addSubview(emojiImageView)
        contentView.addSubview(emojiName)
        contentView.addSubview(emojiDescription)
        contentView.addSubview(buy)
    }

    @objc func buyTapped() {
        if let id = emojiId {
            delegate?.didButtonTapped(id: id)
            NotificationCenter.default.post(name: .pushToCart, object: emojiId)
        }
    }
}
