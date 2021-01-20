//
//  HistoryData.swift
//  EmoticonApp
//
//  Created by 이청원 on 2021/01/20.
//

import Foundation

struct HistoryData {
    static let db = UserDefaults.standard
    
    static func getData() -> [History]? {
        var histories:[History]?
        if let data = UserDefaults.standard.value(forKey:"history") as? Data {
            histories = try? PropertyListDecoder().decode([History].self, from: data)
        }
        return histories
    }

    static func addData(_ data: [History]) {
        db.set(try? PropertyListEncoder().encode(data), forKey:"history")
    }
}
