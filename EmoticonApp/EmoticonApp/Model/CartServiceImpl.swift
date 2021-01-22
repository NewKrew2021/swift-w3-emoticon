//
//  CartServiceImpl.swift
//  EmoticonApp
//
//  Created by 윤준수 on 2021/01/20.
//

import Foundation

class CartServiceImpl: CartService {
    
    static let instance: CartService = CartServiceImpl()
    var products: [Product] = []
    public var count: Int {
        get {
            return products.count
        }
    }
    
    private init() {}
    
    public func addProduct(product: Product) {
        products.append(product)
        NotificationCenter.default.post(name: .cartsChanged, object: nil)
    }
    
    public func setProducts(products: [Product]) {
        self.products = products
        NotificationCenter.default.post(name: .cartsChanged, object: nil)
    }
    
    public func removeProduct(at: Int) {
        products.remove(at: at)
        NotificationCenter.default.post(name: .cartsChanged, object: nil)
    }
    
    public func removeAll() {
        products.removeAll()
        NotificationCenter.default.post(name: .cartsChanged, object: nil)
    }
    
    subscript(index: Int) -> Product {
        return products[index]
    }
}
