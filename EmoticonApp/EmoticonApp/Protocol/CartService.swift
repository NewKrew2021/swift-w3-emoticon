//
//  CartService.swift
//  EmoticonApp
//
//  Created by 윤준수 on 2021/01/20.
//

import Foundation

protocol CartService {
    var count: Int { get }
    var products: [Product] { get set }
    static var instance: CartService { get }
    func addProduct(product: Product)
    func setProducts(products: [Product])
    func removeProduct(at: Int)
    func removeAll()
    subscript(at: Int) -> Product { get }
}
