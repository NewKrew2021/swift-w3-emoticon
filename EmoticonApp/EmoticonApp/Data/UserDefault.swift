//
//  UserDefault.swift
//  EmoticonApp
//
//  Created by 지현우 on 2021/01/19.
//

import Foundation

struct UserDefault {
    // UserDefaults.standard 자체가 싱글톤

    static let db = UserDefaults.standard

    static func getData() -> Data? {
        return db.data(forKey: "histories") ?? nil
    }

    static func addData(_ dataArray: [History]) {
        if let data = try? PropertyListEncoder().encode(dataArray){
            UserDefault.db.set(data, forKey: "histories")
        }
    }
}
