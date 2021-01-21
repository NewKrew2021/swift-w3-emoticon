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
    var idToCartItem: [UUID: CartItem] { get }
    var count: Int { get }
    func push(emojiId: UUID)
    func pop(emojiId: UUID)
    func remove(at index: Int)
    mutating func clear()
    subscript(index: Int) -> CartItem { get }
}

struct CartItem: Codable {
    let emojiId: UUID
    let time: Date
    init(emojiId: UUID) {
        self.emojiId = emojiId
        self.time = Date()
    }
}

class Cart: CartType, CustomStringConvertible {
    typealias CartDictionaryType = [UUID: CartItem]
    var description: String {
        return self.idToCartItem.description
    }
    static let shared: CartType = Cart()
    internal let defaults: UserDefaults = UserDefaults.standard
    internal var idToCartItem: CartDictionaryType
    private let cartKey: String = "Cart"
    var count: Int {
        return self.idToCartItem.keys.count
    }

    init() {
        idToCartItem = CartDictionaryType()
        if let saveData = defaults.object(forKey: cartKey) as? Data {
            let propertyDecoder = PropertyListDecoder()
            do {
                let data: CartDictionaryType? = try? propertyDecoder.decode(CartDictionaryType.self, from: saveData)
                idToCartItem = data ?? CartDictionaryType()
            }
        }
    }

    deinit {
        let data = try? PropertyListEncoder().encode(idToCartItem)
        defaults.set(data, forKey: cartKey)
    }

    func push(emojiId: UUID) {
        idToCartItem[emojiId] = CartItem(emojiId: emojiId)
    }

    func pop(emojiId: UUID) {
        idToCartItem[emojiId] = nil
    }

    func remove(at index: Int) {
        let key = Array(idToCartItem.keys)[index]
        self.idToCartItem[key] = nil
    }

    func clear() {
        for key in idToCartItem.keys {
            idToCartItem[key] = nil
        }
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
