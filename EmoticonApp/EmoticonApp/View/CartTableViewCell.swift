//
//  CartTableViewCell.swift
//  EmoticonApp
//
//  Created by 이청원 on 2021/01/21.
//

import UIKit

class CartTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    override func layoutSubviews() {
        self.titleLabel.sizeToFit()
    }
    
    func setData(title:String, date:Date) {
        self.titleLabel.text = title
        self.dateLabel.text = date.description
    }
}
