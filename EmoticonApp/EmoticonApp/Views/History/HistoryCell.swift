//
//  Cell.swift
//  EmoticonApp
//
//  Created by bean Milky on 2021/01/21.
//

import UIKit

class HistoryTableViewCell: UITableViewCell {
    static let cellIdentifier: String = "HistoryTableViewCell"
    private var emojiId: UUID?
    private var emojiName: UILabel = UILabel()
    private var emojiDescription: UILabel = UILabel()
    private let dateFormatter = DateFormatter()
    private let emojiService = EmojiService.shared

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

    func setProperty(cartItem: CartItem) {
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        emojiDescription.text = dateFormatter.string(from: cartItem.time)
        emojiId = cartItem.emojiId
        if let emoji = emojiService.findById(id: emojiId ?? UUID()) {
            emojiName.text = emoji.title
        }
        else if let emoji = emojiService.findByTitle(title: cartItem.emojiName) {
            emojiName.text = emoji.title
        }
    }

    private func setUI() {
        let width = contentView.frame.width
        let height = contentView.frame.height
        emojiDescription.textAlignment = .center
        self.resize(width: width, height: height)
    }
    func resize(width: CGFloat) {
        self.resize(width: width, height: contentView.frame.height)
    }
    func resize(height: CGFloat) {
        self.resize(width: contentView.frame.width, height: height)
    }
    func resize(width: CGFloat, height: CGFloat) {
        emojiName.frame.size = CGSize(width: width/2, height: height)
        emojiDescription.frame.size = CGSize(width: width/2, height: height)
        emojiName.frame.origin = CGPoint(x: 0, y: 0)
        emojiDescription.frame.origin = CGPoint(x: width/2, y: 0)
    }

    private func addContentView() {
        contentView.addSubview(emojiName)
        contentView.addSubview(emojiDescription)
    }
}
