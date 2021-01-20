//
//  EmoticonExtension.swift
//  EmoticonApp
//
//  Created by 이청원 on 2021/01/20.
//

import UIKit

extension Emoticon {
    func image(index : Int) -> UIImage {
        return UIImage(named: self.list[index]["image"] ?? "") ?? UIImage()
    }
}
