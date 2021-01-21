//
//  CartServiceImpl.swift
//  EmoticonApp
//
//  Created by 윤준수 on 2021/01/20.
//

import Foundation

class CartServiceImpl: CartService {
    
    static let instance: CartService = CartServiceImpl()
    private var products: [Product] = []
    public var count: Int {
        get {
            return products.count
        }
    }
    
    private init() {}
    
    public func addProduct(product: Product) {
        products.append(product)
    }
    
    subscript(index: Int) -> Product {
        return products[index]
    }
    
    public func removeProduct(at: Int) {
        products.remove(at: at)
    }
    
    public func removeAll() {
        products.removeAll()
    }
}
