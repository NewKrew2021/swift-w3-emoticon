//
//  Cart.swift
//  EmoticonApp
//
//  Created by 지현우 on 2021/01/19.
//

import Foundation

struct Cart {
    private static var ownEmoticons: [History] = []

    static var count: Int{
        ownEmoticons.count
    }
    
    static func buyEmoticon(title: String, date: Date) {
        ownEmoticons.append(History(title: title, date: date))
    }
}

struct History {
    let title: String
    let date: Date
}
