//
//  ViewController.swift
//  EmoticonApp
//
//  Created by 윤준수 on 2021/01/18.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var eventTitle: UILabel!
    @IBOutlet weak var upperView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        if let patternImgage = UIImage(named: "pattern"){
            upperView.backgroundColor = UIColor(patternImage: patternImgage)
        }
        
        eventTitle.lineBreakStrategy = .hangulWordPriority
    }
}

