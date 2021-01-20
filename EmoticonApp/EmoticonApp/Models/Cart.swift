//
//  Cart.swift
//  EmoticonApp
//
//  Created by bean Milky on 2021/01/20.
//

import Foundation

protocol CartType {
    static var shared: CartType { get }
    var defaults: UserDefaults { get }
    var dict: Dictionary<String, EmojiType> { get }
    func find(id: String) -> EmojiType?
    mutating func push(emoji: EmojiType)
    mutating func pop(emoji: EmojiType)
    mutating func clear()
}

class Cart: CartType, CustomStringConvertible {
    var description: String {
        return self.dict.description
    }
    static let shared: CartType = Cart()
    internal let defaults: UserDefaults = UserDefaults.standard
    internal var dict: Dictionary<String, EmojiType> = [String: EmojiType]()
    private let cartKey: String = "Cart"
    
    init() {
        if let save = defaults.value(forKey: cartKey) as? Dictionary<String, EmojiType> {
            dict = save
        }
    }
    
    deinit {
        defaults.set(dict, forKey: cartKey)
    }
    
    func find(id: String) -> EmojiType? {
        return dict[id]
    }
    
    func push(emoji: EmojiType) {
        dict[emoji.id] = emoji
    }

    func pop(emoji: EmojiType) {
        dict[emoji.id] = nil
    }

    func clear() {
        for key in dict.keys {
            dict[key] = nil
        }
    }
}

