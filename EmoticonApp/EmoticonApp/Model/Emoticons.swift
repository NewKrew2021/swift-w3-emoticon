//
//  Emoticon.swift
//  EmoticonApp
//
//  Created by Hochang Lee on 2021/01/19.
//

import Foundation

struct Emoticons {
    
    static private var emoticons : [Emoticon] = []
    
    static func getEmoticons() -> [Emoticon] {
        if emoticons.count == 0 {
            registerEmoticons()
        }
        return emoticons
    }
    
    static func registerEmoticons() {
        for data in list {
            guard let title = data["title"], let author = data["author"], let image = data["image"] else { return }
            emoticons.append(Emoticon(title: title, author: author, image: image))
        }
    }
}

struct Emoticon {
    private var _title : String
    private var _author : String
    private var _image : String
    var title : String {
        get {
            return _title
        }
        set(newTitle) {
            _title = newTitle
        }
    }
    var author : String {
        get {
            return _author
        }
        set(newAuthor) {
            _author = newAuthor
        }
    }
    var image : String {
        get {
            return _image
        }
        set(newImage) {
            _image = newImage
        }
    }
    
    init(title : String, author : String, image : String) {
        self._title = title
        self._author = author
        self._image = image
    }
    
}

private var list = [
    [ "title" : "유년기오구의 쪼꼬만 일상", "author" : "문랩", "image" : "image01.png" ],
    [ "title" : "콩글리시 이즈 꿀잼2", "author" : "노페이퍼", "image" : "image02.png" ],
    [ "title" : "진짜 찐?", "author" : "mohe", "image" : "image03.png" ],
    [ "title" : "바다 갈매기 매봉이는 여유로워", "author" : "이우산", "image" : "image04.png" ],
    [ "title" : "공하 3 (공주하이)", "author" : "봉이봉봉봉", "image" : "image05.png" ],
    [ "title" : "무새무새의 몸짓들", "author" : "SO", "image" : "image06.png" ],
    [ "title" : "열심히 산다 빠릿빠릿 곰", "author" : "HIPUP PLANET", "image" : "image07.png" ],
    [ "title" : "반전! 주접콘", "author" : "잼잼", "image" : "image08.png" ],
    [ "title" : "3단티콘", "author" : "나그", "image" : "image09.png" ],
    [ "title" : "넌 나의 비타민~", "author" : "무릎이 임선경", "image" : "image10.png" ],
    [ "title" : "하찮은 외계인 밍찡", "author" : "라밍", "image" : "image11.png" ],
    [ "title" : "안녕! 아기 보노보노", "author" : "보노보노", "image" : "image12.png" ]
    ]
