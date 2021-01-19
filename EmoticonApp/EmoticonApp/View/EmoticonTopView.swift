//
//  EmoticonTopView.swift
//  EmoticonApp
//
//  Created by 이청원 on 2021/01/19.
//

import UIKit

class EmoticonTopView: UIView {

    @IBOutlet weak var topViewText: UILabel!
    
    func loadView() {
        self.backgroundColor = UIColor(patternImage: UIImage(named: "pattern") ?? UIImage())
        self.topViewText.text = "친구 추가하면\n겨울맞이\n이모티콘 선물!"
        self.topViewText.sizeToFit()
    }
}
