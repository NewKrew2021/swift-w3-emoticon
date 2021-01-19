//
//  UITableViewCell+.swift
//  EmoticonApp
//
//  Created by 지현우 on 2021/01/19.
//

import UIKit

extension UITableViewCell {
    func setBorder(width: CGFloat, color: CGColor) {
        self.layer.borderWidth = width
        self.layer.borderColor = color
    }
}
