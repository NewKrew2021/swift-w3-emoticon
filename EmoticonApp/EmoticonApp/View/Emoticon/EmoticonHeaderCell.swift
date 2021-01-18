//
//  EmoticonHeaderCell.swift
//  EmoticonApp
//
//  Created by 지현우 on 2021/01/18.
//

import UIKit

class EmoticonHeaderCell: UITableViewHeaderFooterView {
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    override func awakeFromNib() {
        self.backgroundColor = UIColor(patternImage: UIImage(named: "pattern.png") ?? UIImage())
    }
}
