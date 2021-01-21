//
//  Cart.swift
//  EmoticonApp
//
//  Created by bean Milky on 2021/01/20.
//

import Foundation

protocol CartItemType {
    var emoji: EmojiType { get }
    var time: Date { get }
}

protocol CartType {
    static var shared: CartType { get }
    var defaults: UserDefaults { get }
    var dict: [String: CartItem] { get }
    var count: Int { get }
    func find(id: String) -> CartItem?
    func push(emoji: EmojiType)
    func pop(emoji: EmojiType)
    mutating func clear()
    subscript(index: Int) -> CartItem { get }
}

struct CartItem: CartItemType {
    let emoji: EmojiType
    let time: Date
    init(emoji: EmojiType) {
        self.emoji = emoji
        self.time = Date()
    }
}

class Cart: CartType, CustomStringConvertible {

    var description: String {
        return self.dict.description
    }
    static let shared: CartType = Cart()
    internal let defaults: UserDefaults = UserDefaults.standard
    internal var dict: [String: CartItem] = [String: CartItem]()
    private let cartKey: String = "Cart"
    var count: Int {
        return self.dict.keys.count
    }

    init() {
        if let save = defaults.value(forKey: cartKey) as? [String: CartItem] {
            dict = save
        }
    }

    deinit {
        defaults.set(dict, forKey: cartKey)
    }

    func find(id: String) -> CartItem? {
        return dict[id]
    }

    func push(emoji: EmojiType) {
        dict[emoji.id] = CartItem(emoji: emoji)
    }

    func pop(emoji: EmojiType) {
        dict[emoji.id] = nil
    }

    func clear() {
        for key in dict.keys {
            dict[key] = nil
        }
    }

    subscript(index: Int) -> CartItem {
        let (_, value) = self.dict[dict.index(dict.startIndex, offsetBy: index)]
        return value
    }

}
