//
//  Cart.swift
//  EmoticonApp
//
//  Created by 이청원 on 2021/01/20.
//

import Foundation

struct Cart : CartService {
    
    static var data = HistoryData.getData() ?? [History]()

    static func add(history:History) {
        data.append(history)
        HistoryData.updateData(self.data)
    }
    
    static func removeAll() {
        self.data.removeAll()
        HistoryData.updateData(self.data)
    }
    
    static func remove(index: Int) {
        self.data.remove(at: index)
        HistoryData.updateData(self.data)
    }
    
    static subscript(at index: Int) -> History? {
        return self.data[index]
    }
    
    static var count: Int {
        return self.data.count
    }
}
