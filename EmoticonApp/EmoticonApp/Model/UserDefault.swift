//
//  UserDefault.swift
//  EmoticonApp
//
//  Created by Hochang Lee on 2021/01/21.
//

import Foundation

struct UserDefault {
    private static let key = "histories"

    static func getData() -> [History] {
        var arr: [History] = []
        if let data = UserDefaults.standard.data(forKey: key) {
            let dataArray = try! PropertyListDecoder().decode([History].self, from: data)
            arr = dataArray
        }
        return arr
    }

    static func setData(_ dataArray: [History]) {
        if let data = try? PropertyListEncoder().encode(dataArray) {
            UserDefaults.standard.set(data, forKey: key)
        }
    }
}

