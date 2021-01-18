//
//  ViewController.swift
//  EmoticonApp
//
//  Created by 이청원 on 2021/01/18.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var topViewText: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        topView.backgroundColor = UIColor(patternImage: UIImage(named: "pattern") ?? UIImage())
        topViewText.text = "친구 추가하면\n겨울맞이\n이모티콘 선물!"
        topViewText.sizeToFit()
    }

}

