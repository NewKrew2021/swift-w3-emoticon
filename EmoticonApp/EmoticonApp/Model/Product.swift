//
//  Cart.swift
//  EmoticonApp
//
//  Created by 윤준수 on 2021/01/20.
//

import Foundation

class Product {
    let emoticonName: String
    let selectTimeAndDate: String
    private let formatter = DateFormatter()
    
    init(emoticonName: String) {
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        self.emoticonName = emoticonName
        self.selectTimeAndDate = formatter.string(from: Date())
    }
}
