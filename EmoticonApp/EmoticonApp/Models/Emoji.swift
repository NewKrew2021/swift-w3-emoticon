//
//  emoji.swift
//  EmoticonApp
//
//  Created by bean Milky on 2021/01/19.
//

import Foundation

protocol EmojiType {
    var property: [String: String] { get }
}

protocol EmojiListModel {
    var list: [EmojiType] { get }
    var count: Int { get }
    mutating func append(_ newElement: EmojiType)
    mutating func remove(at: Int)
}

struct Emoji: EmojiType {
    var property: [String: String] = [String: String]()
    init(title: String, author: String, image: String) {
        property["title"] = title
        property["author"] = author
        property["image"] = image
    }
}

struct EmojiList: EmojiListModel {
    var list: [EmojiType]
    var count: Int {
        return list.count
    }

    mutating func append(_ newElement: EmojiType) {
        list.append(newElement)
    }

    mutating func remove(at: Int) {
        list.remove(at: at)
    }
}

extension EmojiList {
    subscript(index: Int) -> EmojiType {
      get {
        return self.list[index]
      }
      set (newValue) {
        self.list[index] = newValue
      }
    }
}

extension EmojiList: Sequence {
  func makeIterator() -> IndexingIterator<[EmojiType]> {
    return list.makeIterator()
  }
}
