//
//  EmoticonExtension.swift
//  EmoticonApp
//
//  Created by 이청원 on 2021/01/20.
//

import UIKit

extension Emoticon {
    static func image(index : Int) -> UIImage {
        return UIImage(named: Emoticon.list[index]["image"] ?? "") ?? UIImage()
    }
}
