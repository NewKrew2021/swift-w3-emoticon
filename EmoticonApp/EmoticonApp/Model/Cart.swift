//
//  Cart.swift
//  EmoticonApp
//
//  Created by 지현우 on 2021/01/19.
//

import Foundation

struct Cart {
    static let shared = Self()
    var ownEmoticons: [History] = {
        var array: [History] = []
        if let data = UserDefault.getData() {
            let dataArray = try! PropertyListDecoder().decode([History].self, from: data)
            array = dataArray
        }
        return array
    }()

    var count: Int {
        ownEmoticons.count
    }

    mutating func buyEmoticon(title: String, date: Date) {
        ownEmoticons.append(History(title: title, date: date))
        UserDefault.addData(ownEmoticons)
    }

    mutating func remove(index: Int) {
        ownEmoticons.remove(at: index)
    }

    mutating func removeAll() {
        ownEmoticons.removeAll()
    }

    subscript(index: Int) -> History {
        return ownEmoticons[index]
    }
}

struct History: Codable {
    let title: String
    let date: Date
}
