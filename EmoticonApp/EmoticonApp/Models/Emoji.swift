//
//  emoji.swift
//  EmoticonApp
//
//  Created by bean Milky on 2021/01/19.
//

import Foundation

protocol EmojiListType {
    var list: [Emoji] { get }
    var count: Int { get }
    func append(_ newElement: Emoji)
    func remove(at: Int)
    func findById(id: UUID) -> Emoji?
    func findByTitle(title: String) -> Emoji?
    subscript(index: Int) -> Emoji { get set }
}

struct Emoji {
    let id: UUID
    let title: String
    let author: String
    let image: String

    init(title: String, author: String, image: String) {
        self.title = title
        self.author = author
        self.image = image
        self.id = UUID()
    }
}

class EmojiList: EmojiListType {

    var list: [Emoji]
    var count: Int {
        return list.count
    }

    init() {
        list = [Emoji]()
    }

    init(list: [Emoji]) {
        self.list = list
    }

    func append(_ newElement: Emoji) {
        list.append(newElement)
    }

    func remove(at: Int) {
        list.remove(at: at)
    }

    func findById(id: UUID) -> Emoji? {
        for emoji in list where emoji.id == id {
            return emoji
        }
        return nil
    }
    func findByTitle(title: String) -> Emoji? {
        for emoji in list where emoji.title == title {
            return emoji
        }
        return nil
    }
}

class EmojiService {
    private(set) var data: EmojiListType = EmojiList()

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
    func findById(id: UUID) -> Emoji? {
        return self.data.findById(id: id)
    }
    func findByTitle(title: String) -> Emoji? {
        return self.data.findByTitle(title: title)
    }

}

extension EmojiList {
    subscript(index: Int) -> Emoji {
      get {
        return self.list[index]
      }
      set (newValue) {
        self.list[index] = newValue
      }
    }
}

extension EmojiList: Sequence {
  func makeIterator() -> IndexingIterator<[Emoji]> {
    return list.makeIterator()
  }
}
