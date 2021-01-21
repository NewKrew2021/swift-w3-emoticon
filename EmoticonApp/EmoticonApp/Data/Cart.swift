//
//  Cart.swift
//  EmoticonApp
//
//  Created by 지현우 on 2021/01/19.
//

import Foundation

class Cart {
    static let shared = Cart()
    private let db = UserDefault()
    private var ownEmoticons: [History]

    var count: Int {
        ownEmoticons.count
    }

    private init() {
        ownEmoticons = db.getData()
    }

    func buyEmoticon(history: History) {
        ownEmoticons.append(history)
        db.setData(ownEmoticons)
    }

    func remove(index: Int, completionHandler: @escaping () -> Void) {
        ownEmoticons.remove(at: index)
        db.setData(ownEmoticons)
        completionHandler()
    }

    func removeAll(completionHandler: @escaping () -> Void) {
        ownEmoticons.removeAll()
        db.setData(ownEmoticons)
        completionHandler()
    }

    subscript(index: Int) -> History {
        return ownEmoticons[index]
    }
}

struct History: Codable {
    let title: String
    let date: Date
}
