//
//  ViewController.swift
//  EmoticonApp
//
//  Created by Hochang Lee on 2021/01/18.
//

import UIKit

class ViewController: UIViewController {

    private var upperView = UpperView()
    @IBOutlet weak var belowView: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.addSubview(upperView)
        upperView.setUpperView(standardView: view)
        upperView.setUpperInnerView(padding: CGFloat(20))
        upperView.setUpperImage(named: "basket")
        upperView.setUpperImageView()
        upperView.setTitleInView()
        upperView.setDescriptionInView()
        
        belowView.setBelowView(upperView: upperView, superView: view)
    }
}
