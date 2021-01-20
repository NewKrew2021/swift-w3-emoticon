//
//  Cart.swift
//  EmoticonApp
//
//  Created by 지현우 on 2021/01/19.
//

import Foundation

struct Cart {
    static let shared = Self()
    private let db = UserDefault()
    private var ownEmoticons: [History] {
        db.getData() ?? []
    }

    var count: Int {
        ownEmoticons.count
    }

    mutating func buyEmoticon(title: String, date: Date) {
        var arr = ownEmoticons
        arr.append(History(title: title, date: date))
        db.setData(arr)
    }

    mutating func remove(index: Int) {
        var arr = ownEmoticons
        arr.remove(at: index)
        db.setData(arr)
    }

    mutating func removeAll() {
        var arr = ownEmoticons
        arr.removeAll()
        db.setData(arr)
    }

    subscript(index: Int) -> History {
        return ownEmoticons[index]
    }
}

struct History: Codable {
    let title: String
    let date: Date
}
