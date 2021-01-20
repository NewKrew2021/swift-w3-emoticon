//
//  EmoticonService.swift
//  EmoticonApp
//
//  Created by 윤준수 on 2021/01/19.
//

import Foundation

class EmoticonService {
    static let instance = EmoticonService()
    private var emoticons: [Emoticon] = []
    public var count: Int {
        get {
            return emoticons.count
        }
    }
    
    private init() {
        let list = [
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
        for data in list {
            guard let title: String = data["title"], let author:String = data["author"], let image: String = data["image"] else { continue }
            emoticons.append(Emoticon(title: title, author: author, image: image))
        }
    }
    
    public func addEmoticon(emoticon: Emoticon) {
        emoticons.append(emoticon)
    }
    
    public func getEmoticon(at: Int) -> Emoticon {
        return emoticons[at]
    }
}
