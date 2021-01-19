//
//  Cart.swift
//  EmoticonApp
//
//  Created by 지현우 on 2021/01/19.
//

import Foundation

struct Cart {
    static var ownEmoticons: [History] = []

    static var count: Int {
        ownEmoticons.count
    }

    static func buyEmoticon(title: String, date: Date) {
        ownEmoticons.append(History(title: title, date: date))
    }

    static subscript(index: Int) -> History {
        return ownEmoticons[index]
    }
}

struct History {
    let title: String
    let date: Date
}
