//
//  EmoticonService.swift
//  EmoticonApp
//
//  Created by 윤준수 on 2021/01/20.
//

import Foundation

protocol EmoticonService {
    var count: Int { get }
    static var instance: EmoticonService { get }
    func addEmoticon(emoticon: Emoticon)
    subscript(at: Int) -> Emoticon { get }
}
