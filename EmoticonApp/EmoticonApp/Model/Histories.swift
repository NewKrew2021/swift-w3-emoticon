//
//  Histories.swift
//  EmoticonApp
//
//  Created by Hochang Lee on 2021/01/20.
//

import Foundation

struct HistoryCart : HistoriesProtocol{
    static private var histories : [History] = []
    static private var histories: HistoriesProtocol
    static var count: Int {
        get {
            return histories.count
        }
    }
    
    static func getHistory(index: Int) -> History {
        return histories[index]
    }
    
    static func addHistory(history: History) {
        histories.append(history)
    }
    
    static func deleteHistory(title: String, time: String) {
        for index in 0...count {
            let history = getHistory(index: index)
            if history.title == title && history.time == time {
                histories.remove(at: index)
                return
            }
        }
    }
    
    static func clearHistory() {
        histories.removeAll()
    }
}

struct History : Hashable{
    private var _title : String
    private var _time : String
    var title : String {
        get {
            return _title
        }
        set(newTitle) {
            _title = newTitle
        }
    }
    var time : String {
        get {
            return _time
        }
        set(newTime) {
            _time = newTime
        }
    }
    init(title : String, time : String) {
        _title = title
        _time = time
    }
}
