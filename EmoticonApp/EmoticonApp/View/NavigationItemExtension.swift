//
//  NavigationItemExtension.swift
//  EmoticonApp
//
//  Created by Hochang Lee on 2021/01/20.
//

import UIKit

extension UINavigationItem {
    func setNavigationItem() {
        title = "emoticon"
        let item = UIBarButtonItem()
        item.title = ""
        item.image = UIImage(systemName: "cart.fill")
        setRightBarButton(item, animated: true)
    }
}
