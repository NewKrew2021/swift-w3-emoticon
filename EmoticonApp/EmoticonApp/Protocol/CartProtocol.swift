//
//  HistoriesProtocol.swift
//  EmoticonApp
//
//  Created by Hochang Lee on 2021/01/21.
//

import Foundation

protocol CartProtocol {
    
    var count : Int { get }
    static var historyCart : CartProtocol? { get }
    static func getHistoryCart() -> CartProtocol
    func getHistory(index : Int) -> History
    mutating func addHistory(history : History)
    mutating func deleteHistory(index : Int)
    mutating func clearHistory()
}
