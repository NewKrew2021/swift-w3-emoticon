//
//  CartService.swift
//  EmoticonApp
//
//  Created by 이청원 on 2021/01/21.
//

import Foundation

protocol CartService {
    static func add(history:History)
    static func removeAll()
    static func remove(index: Int)
    static subscript(at index: Int) -> History? { get }
    static var count: Int { get }
}
