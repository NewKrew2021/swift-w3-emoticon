//
//  HistoriesProtocol.swift
//  EmoticonApp
//
//  Created by Hochang Lee on 2021/01/21.
//

import Foundation

protocol HistoriesProtocol {
    
    static var count : Int { get }
    static func getHistory(index : Int) -> History
    static func addHistory(history : History)
    static func deleteHistory(title : String, time : String)
    static func clearHistory()
}
