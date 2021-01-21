//
//  Cell.swift
//  EmoticonApp
//
//  Created by bean Milky on 2021/01/21.
//

import UIKit

class HistoryTableViewCell: UITableViewCell {
    static let cellIdentifier: String = "HistoryTableViewCell"
    private var emojiId: String = ""
    var emojiName: UILabel = UILabel()
    var emojiDescription: UILabel = UILabel()
    private let dateFormatter = DateFormatter()

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

    func setProperty(id: String, title: String, time: Date) {
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        emojiId = id
        emojiName.text = title
        emojiDescription.text = dateFormatter.string(from: time)
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
