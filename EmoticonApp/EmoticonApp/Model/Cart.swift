//
//  Cart.swift
//  EmoticonApp
//
//  Created by 이청원 on 2021/01/20.
//

import Foundation

struct Cart {
    var data = HistoryData.getData()
    
    mutating func add(title:String, date:Date) {
        self.data?.append(History(title: title, data: date))
        HistoryData.addData(data ?? [History]())
    }
}
