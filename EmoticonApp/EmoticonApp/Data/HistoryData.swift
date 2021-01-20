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
        let data = db.data(forKey: "history")
        let decodedArray = try! JSONDecoder().decode([History].self, from: data!)
        return decodedArray
    }

    static func addData(_ data: [History]) {
        let encodedArray = try! JSONEncoder().encode(data)
        db.set(encodedArray, forKey: "history")
    }
}
