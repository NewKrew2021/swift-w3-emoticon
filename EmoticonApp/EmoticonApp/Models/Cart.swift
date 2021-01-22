//
//  Cart.swift
//  EmoticonApp
//
//  Created by bean Milky on 2021/01/20.
//

import Foundation

protocol CartType {
    var defaults: UserDefaults { get }
    var idToCartItem: [UUID: CartItem] { get }
    var count: Int { get }
    func push(emoji: Emoji)
    func pop(emoji: Emoji)
    func remove(at index: Int)
    func loadDataFromUserDefaults()
    func synchronizeDataWithUserDefaults()
    func clear()
    subscript(index: Int) -> CartItem { get }
}

struct CartItem: Codable {
    let emojiId: UUID
    let emojiName: String
    let time: Date
    init(emoji: Emoji) {
        self.emojiId = emoji.id
        self.emojiName = emoji.title
        self.time = Date()
    }
}

class Cart: CartType, CustomStringConvertible {
    typealias CartDictionaryType = [UUID: CartItem]
    var description: String {
        return self.idToCartItem.description
    }
    internal let defaults: UserDefaults = UserDefaults.standard
    internal var idToCartItem: CartDictionaryType
    private let cartKey: String = "Cart"
    var count: Int {
        return self.idToCartItem.keys.count
    }

    init() {
        idToCartItem = CartDictionaryType()
        self.loadDataFromUserDefaults()
    }

    deinit {
        let data = try? PropertyListEncoder().encode(idToCartItem)
        defaults.set(data, forKey: cartKey)
    }

    func push(emoji: Emoji) {
        idToCartItem[emoji.id] = CartItem(emoji: emoji)
    }

    func pop(emoji: Emoji) {
        idToCartItem[emoji.id] = nil
    }

    func remove(at index: Int) {
        let key = Array(idToCartItem.keys)[index]
        self.idToCartItem[key] = nil
    }

    func clear() {
        for key in idToCartItem.keys {
            idToCartItem[key] = nil
        }
        NotificationCenter.default.post(name: .clearCart, object: nil)
    }
    
    internal func loadDataFromUserDefaults() {
        if let saveData = defaults.object(forKey: cartKey) as? Data {
            let propertyDecoder = PropertyListDecoder()
            do {
                let data: CartDictionaryType? = try? propertyDecoder.decode(CartDictionaryType.self, from: saveData)
                idToCartItem = data ?? CartDictionaryType()
            }
        }
    }
    
    func synchronizeDataWithUserDefaults() {
        let data = try? PropertyListEncoder().encode(idToCartItem)
        defaults.set(data, forKey: cartKey)
    }

    subscript(index: Int) -> CartItem {
        get {
            let (_, value) = self.idToCartItem[idToCartItem.index(idToCartItem.startIndex, offsetBy: index)]
            return value
        }
        set {
            let key = Array(idToCartItem.keys)[index]
            self.idToCartItem[key] = newValue
        }
    }

}
