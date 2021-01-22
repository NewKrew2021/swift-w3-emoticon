//
//  Histories.swift
//  EmoticonApp
//
//  Created by Hochang Lee on 2021/01/20.
//

import Foundation

class HistoryCart : CartProtocol{
    
    private var histories : [History] = []
    static internal var historyCart: CartProtocol?
    var count: Int {
        get {
            return histories.count
        }
    }
        
    static func getHistoryCart() -> CartProtocol{
        if let returnCart = historyCart {
            return returnCart
        } else {
            historyCart = HistoryCart()
            return historyCart!
        }
    }
    
    func restoreHistories() {
        histories = UserDefault.getData()
    }

    func getHistory(index: Int) -> History {
        return histories[index]
    }
    
    func getHistories() -> [History] {
        return histories
    }
    
    func addHistory(history: History) {
        histories.append(history)
    }
    
    func deleteHistory(index : Int) {
        histories.remove(at: index)
    }
    
    func clearHistory() {
        histories.removeAll()
    }
}

struct History : Hashable, Codable{
    let title : String
    let time : Date
}


