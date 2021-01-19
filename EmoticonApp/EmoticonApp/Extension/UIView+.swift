//
//  UIView+.swift
//  EmoticonApp
//
//  Created by 윤준수 on 2021/01/19.
//

import UIKit

extension UIView{
    public var safeAreaFrame: CGRect {
        return safeAreaLayoutGuide.layoutFrame
    }
}
