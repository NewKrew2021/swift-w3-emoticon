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
        self.setBorder(width: 0.2, color: UIColor.black.cgColor)
    }
}

extension EmoticonTableViewCell {
    func setBorder(width: CGFloat, color: CGColor) {
        self.layer.borderWidth = width
        self.layer.borderColor = color
    }
}
