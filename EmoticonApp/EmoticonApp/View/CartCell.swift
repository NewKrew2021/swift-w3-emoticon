//
//  CartCell.swift
//  EmoticonApp
//
//  Created by 윤준수 on 2021/01/20.
//

import UIKit

class CartCell: UITableViewCell {

    @IBOutlet weak var emoticonName: UILabel!
    @IBOutlet weak var selectDateAndTime: UILabel!
    let formatter = DateFormatter()
    
    func setCell(emoticonName: String) {
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        self.emoticonName.text = emoticonName
        self.selectDateAndTime.text = formatter.string(from: Date())
    }
}
