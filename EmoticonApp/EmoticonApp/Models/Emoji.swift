//
//  emoji.swift
//  EmoticonApp
//
//  Created by bean Milky on 2021/01/19.
//

import Foundation

protocol EmojiType {
    var id: String { get }
    var title: String { get }
    var author: String { get }
    var image: String { get }
}

protocol EmojiListModel {
    var list: [EmojiType] { get }
    var count: Int { get }
    mutating func append(_ newElement: EmojiType)
    mutating func remove(at: Int)
    func findById(id: String) -> EmojiType?
    subscript(index: Int) -> EmojiType { get set }
}

struct Emoji: EmojiType {
    let title: String
    let author: String
    let image: String
    let id: String

    enum Property: String {
        case title, author, image
    }

    init(title: String, author: String, image: String) {
        self.title = title
        self.author = author
        self.image = image
        self.id = "emoji-id-\(Emoji.randomId(length: 10))"
    }

    private static func randomId(length: Int) -> String {
        let letters = "abcdefghijklmnopqrstuvwxyz0123456789"
        return String((0..<length).map { _ in letters.randomElement()! })
    }
}

struct EmojiList: EmojiListModel {
    var list: [EmojiType]
    var count: Int {
        return list.count
    }

    init() {
        list = [EmojiType]()
    }

    init(list: [EmojiType]) {
        self.list = list
    }

    mutating func append(_ newElement: EmojiType) {
        list.append(newElement)
    }

    mutating func remove(at: Int) {
        list.remove(at: at)
    }

    func findById(id: String) -> EmojiType? {
        for emoji in list {
            if emoji.id == id {
                return emoji
            }
        }
        return nil
    }
}

class EmojiService {
    private(set) var data: EmojiListModel = EmojiList()

    init() {
        self.getData()
    }
    private func getData() {
        let data = [
              [ "title": "유년기오구의 쪼꼬만 일상", "author": "문랩", "image": "image01.png" ],
              [ "title": "콩글리시 이즈 꿀잼2", "author": "노페이퍼", "image": "image02.png" ],
              [ "title": "진짜 찐?", "author": "mohe", "image": "image03.png" ],
              [ "title": "바다 갈매기 매봉이는 여유로워", "author": "이우산", "image": "image04.png" ],
              [ "title": "공하 3 (공주하이)", "author": "봉이봉봉봉", "image": "image05.png" ],
              [ "title": "무새무새의 몸짓들", "author": "SO", "image": "image06.png" ],
              [ "title": "열심히 산다 빠릿빠릿 곰", "author": "HIPUP PLANET", "image": "image07.png" ],
              [ "title": "반전! 주접콘", "author": "잼잼", "image": "image08.png" ],
              [ "title": "3단티콘", "author": "나그", "image": "image09.png" ],
              [ "title": "넌 나의 비타민~", "author": "무릎이 임선경", "image": "image10.png" ],
              [ "title": "하찮은 외계인 밍찡", "author": "라밍", "image": "image11.png" ],
              [ "title": "안녕! 아기 보노보노", "author": "보노보노", "image": "image12.png" ]
              ]
        self.data = EmojiList(list: data.map { return Emoji(title: $0["title"] ?? "", author: $0["author"] ?? "", image: $0["image"] ?? "default") })
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
