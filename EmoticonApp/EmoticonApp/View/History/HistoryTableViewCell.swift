//
//  HistoryTableViewCell.swift
//  EmoticonApp
//
//  Created by 지현우 on 2021/01/19.
//

import UIKit

class HistoryTableViewCell: UITableViewCell {
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        self.setBorder(width: 0.2, color: UIColor.black.cgColor)
    }
    
    func updateUI(data: Cart.History){
        self.titleLabel.text = data.title
        self.dateLabel.text = data.date.description
    }
}
