//
//  Cart.swift
//  EmoticonApp
//
//  Created by 윤준수 on 2021/01/20.
//

import Foundation

class Product: NSObject, NSCoding {
    let emoticonName: String
    let selectTimeAndDate: String
    private let formatter = DateFormatter()
    
    init(emoticonName: String) {
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss +0000"
        self.emoticonName = emoticonName
        self.selectTimeAndDate = formatter.string(from: Date())
    }
    
    required init?(coder: NSCoder) {
        self.emoticonName = coder.decodeObject(forKey: "emoticonName") as! String
        self.selectTimeAndDate = coder.decodeObject(forKey: "selectTimeAndDate") as! String
    }
    
    func encode(with coder: NSCoder) {
        coder.encode(self.emoticonName, forKey: "emoticonName")
        coder.encode(self.selectTimeAndDate, forKey: "selectTimeAndDate")
    }
}
