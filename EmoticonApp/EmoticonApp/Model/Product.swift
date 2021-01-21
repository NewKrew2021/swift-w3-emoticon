//
//  Cart.swift
//  EmoticonApp
//
//  Created by 윤준수 on 2021/01/20.
//

import Foundation

class Product: NSObject, NSCoding {
    let emoticonName: String
    let selectTimeAndDate: Date
    
    init(emoticonName: String) {
        self.emoticonName = emoticonName
        self.selectTimeAndDate = Date()
    }
    
    required init?(coder: NSCoder) {
        guard let emoticonName = coder.decodeObject(forKey: "emoticonName") as? String,
              let selectTimeAndDate = coder.decodeObject(forKey: "selectTimeAndDate") as? Date
        else { return nil }
        self.emoticonName = emoticonName
        self.selectTimeAndDate = selectTimeAndDate
    }
    
    func encode(with coder: NSCoder) {
        coder.encode(self.emoticonName, forKey: "emoticonName")
        coder.encode(self.selectTimeAndDate, forKey: "selectTimeAndDate")
    }
}
