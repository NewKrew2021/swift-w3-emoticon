//
//  UserDefault.swift
//  EmoticonApp
//
//  Created by 지현우 on 2021/01/19.
//

import Foundation

struct UserDefault {
    private let key_History = "histories"
    let db = UserDefaults.standard

    func getData() -> Data? {
        return db.data(forKey: key_History) ?? nil
    }

    func addData(_ dataArray: [History]) {
        if let data = try? PropertyListEncoder().encode(dataArray) {
            db.set(data, forKey: key_History)
        }
    }
}
