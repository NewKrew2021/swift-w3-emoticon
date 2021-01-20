//
//  Histories.swift
//  EmoticonApp
//
//  Created by Hochang Lee on 2021/01/20.
//

import Foundation

struct Histories {
    
    static private var histories : [History] = []
    static var count : Int {
        return histories.count
    }
    
    static func getHistory(index : Int) -> History {
        return histories[index]
    }
    
    static func addHistory(history : History) {
        histories.append(history)
    }
    
    static func fakeHistory() {
        for data in temphistory {
            histories.append(History(title: data[0], time: data[1]))
        }
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

private var temphistory = [
    ["유년기오구의 쪼꼬만 일상", "2020-11-24 09:51:37 + 0000"],
    ["콩글리시 이즈 꿀잼2", "2020-11-24 09:51:37 + 0000"],
    ["진짜 찐?", "2020-11-24 09:51:37 + 0000"]

]
