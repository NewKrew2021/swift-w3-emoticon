//
//  CartService.swift
//  EmoticonApp
//
//  Created by 윤준수 on 2021/01/20.
//

import Foundation

protocol CartService {
    var count: Int { get }
    static var instance: CartService { get }
    func addProduct(product: Product)
    subscript(at: Int) -> Product { get }
}
