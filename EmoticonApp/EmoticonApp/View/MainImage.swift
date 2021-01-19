//
//  MainImage.swift
//  EmoticonApp
//
//  Created by 윤준수 on 2021/01/19.
//

import UIKit

class MainImage: UIView {

    private let eventMainText: UILabel = UILabel()
    private let eventTitle: UILabel = UILabel()
    private let mainImage: UIView = UIView()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        eventMainText.lineBreakStrategy = .hangulWordPriority
        guard let patternImgage = UIImage(named: "pattern") else { return }
        backgroundColor = UIColor(patternImage: patternImgage)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
