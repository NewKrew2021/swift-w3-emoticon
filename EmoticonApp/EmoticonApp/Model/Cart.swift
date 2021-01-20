//
//  Cart.swift
//  EmoticonApp
//
//  Created by 이청원 on 2021/01/20.
//

import Foundation

struct Cart {
    static var data = HistoryData.getData() ?? [History]()
    
    static func add(history:History) {
        self.data.append(history)
        HistoryData.addData(data)
    }
}
