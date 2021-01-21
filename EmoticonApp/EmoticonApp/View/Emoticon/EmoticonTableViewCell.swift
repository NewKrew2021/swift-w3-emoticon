//
//  EmoticonTableViewCell.swift
//  EmoticonApp
//
//  Created by 지현우 on 2021/01/18.
//

import UIKit

class EmoticonTableViewCell: UITableViewCell {
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var subTitleLabel: UILabel!
    @IBOutlet var imgView: UIImageView!
    @IBOutlet var buyButton: UIButton!

    override func awakeFromNib() {
        super.awakeFromNib()
        setBorder(width: 0.2, color: UIColor.black.cgColor)

        self.buyButton.addTarget(self, action: #selector(self.tappedBuyButton), for: .touchUpInside)
    }

    func updateUI(data: Emoticon) {
        self.titleLabel.text = data.title
        self.subTitleLabel.text = data.author
        self.imageView?.image = UIImage(named: data.imagePath)
    }

    @objc private func tappedBuyButton() {
        if let title = titleLabel.text {
            NotificationCenter.default.post(name: .buyEmoticon, object: History(title: title, date: Date()))
        }
    }
}

extension Notification.Name {
    static let buyEmoticon = Notification.Name("buyEmoticon")
}
