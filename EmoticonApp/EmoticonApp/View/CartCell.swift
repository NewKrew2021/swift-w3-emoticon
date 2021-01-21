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
    
    func setCell(product: Product) {
        selectDateAndTime.text = product.selectTimeAndDate
        emoticonName.text = product.emoticonName
    }
}
