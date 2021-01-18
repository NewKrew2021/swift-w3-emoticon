//
//  UIView+.swift
//  EmoticonApp
//
//  Created by 지현우 on 2021/01/18.
//

import UIKit

extension UIView{
    func setBorder(width: CGFloat, color: CGColor){
        self.layer.borderWidth = width
        self.layer.borderColor = color
    }
    func setRound(by n: Float){
        self.layer.cornerRadius = self.frame.width/CGFloat(n)
        self.clipsToBounds = true
    }
}
