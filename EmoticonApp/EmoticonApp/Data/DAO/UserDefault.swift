//
//  UserDefault.swift
//  EmoticonApp
//
//  Created by 지현우 on 2021/01/19.
//

import Foundation

struct UserDefault {
    private let key_History = "histories"

    func getData() -> [Cart.History] {
        var arr: [Cart.History] = []
        if let data = UserDefaults.standard.data(forKey: key_History) {
            let dataArray = try! PropertyListDecoder().decode([Cart.History].self, from: data)
            arr = dataArray
        }
        return arr
    }

    func setData(_ dataArray: [Cart.History]) {
        if let data = try? PropertyListEncoder().encode(dataArray) {
            UserDefaults.standard.set(data, forKey: key_History)
        }
    }
}
