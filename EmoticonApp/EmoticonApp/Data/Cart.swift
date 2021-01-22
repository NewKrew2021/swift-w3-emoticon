//
//  Cart.swift
//  EmoticonApp
//
//  Created by 지현우 on 2021/01/19.
//

import Foundation

// Struct일 때는 ownEmoticons이 HistoryVC에서 정상적인 개수/데이터로 불리지 않음
// Class 일 때는 정삭적으로 동작 Why??
class Cart {
    struct History: Codable {
        let title: String
        let date: Date
    }

    static let shared = Cart()
    private let db = UserDefault()
    private var ownEmoticons: [History]

    var count: Int {
        ownEmoticons.count
    }

    private init() {
        ownEmoticons = db.getData()
    }

    func saveEmoticons() {
        db.setData(ownEmoticons)
    }

    func buyEmoticon(history: History) {
        ownEmoticons.append(history)
    }

    func remove(at index: Int, completionHandler: @escaping () -> Void) {
        ownEmoticons.remove(at: index)
        completionHandler()
    }

    func removeAll(completionHandler: @escaping () -> Void) {
        ownEmoticons.removeAll()
        completionHandler()
    }

    subscript(index: Int) -> History {
        return ownEmoticons[index]
    }
}
