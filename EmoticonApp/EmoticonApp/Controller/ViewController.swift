//
//  ViewController.swift
//  EmoticonApp
//
//  Created by Hochang Lee on 2021/01/18.
//

import UIKit

class ViewController: UIViewController {

    private var upperView = MyView()
    private var upperInnerView = UIView()
    private var titleInView = UILabel()
    private var descriptionInView = UILabel()
    private var upperImageView = UIImageView()
    private var upperImage = UIImage(named: "basket")
    @IBOutlet weak var belowView: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.addSubview(upperView)
        upperView.translatesAutoresizingMaskIntoConstraints = false
        upperView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        upperView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 1/3).isActive = true
        upperView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        
        upperView.addSubview(upperInnerView)
        upperInnerView.translatesAutoresizingMaskIntoConstraints = false
        let padding : CGFloat = 20
        upperInnerView.topAnchor.constraint(equalTo: upperView.topAnchor, constant: padding).isActive = true
        upperInnerView.bottomAnchor.constraint(equalTo: upperView.bottomAnchor, constant: -padding).isActive = true
        upperInnerView.leadingAnchor.constraint(equalTo: upperView.leadingAnchor, constant: padding).isActive = true
        upperInnerView.trailingAnchor.constraint(equalTo: upperView.trailingAnchor, constant: -padding).isActive = true
        
        upperInnerView.backgroundColor = UIColor(patternImage: UIImage(named: "pattern") ?? UIImage())
        
        belowView.translatesAutoresizingMaskIntoConstraints = false
        belowView.topAnchor.constraint(equalTo: upperView.bottomAnchor).isActive = true
        belowView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        belowView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
     
        upperInnerView.addSubview(upperImageView)
        upperImageView.image = upperImage
        upperImageView.translatesAutoresizingMaskIntoConstraints = false
        upperImageView.topAnchor.constraint(equalTo: upperInnerView.topAnchor).isActive = true
        upperImageView.bottomAnchor.constraint(equalTo: upperInnerView.bottomAnchor).isActive = true
        upperImageView.leadingAnchor.constraint(equalTo: upperInnerView.centerXAnchor).isActive = true
        upperImageView.trailingAnchor.constraint(equalTo: upperInnerView.trailingAnchor).isActive = true
        upperImageView.contentMode = .scaleAspectFit
        
        upperInnerView.addSubview(titleInView)
        titleInView.text = "이벤트"
        titleInView.textColor = UIColor(red: 0, green: 125/255, blue: 1, alpha: 1)
        titleInView.font = UIFont(descriptor: UIFontDescriptor(), size: 20)
        titleInView.translatesAutoresizingMaskIntoConstraints = false
        titleInView.topAnchor.constraint(equalTo: upperInnerView.topAnchor, constant: 10).isActive = true
        titleInView.leadingAnchor.constraint(equalTo: upperInnerView.leadingAnchor, constant: 10).isActive = true
        titleInView.heightAnchor.constraint(equalToConstant: 30).isActive = true
        titleInView.widthAnchor.constraint(equalToConstant: 100).isActive = true
        
        
        upperInnerView.addSubview(descriptionInView)
        descriptionInView.text = "친구 추가하면\n겨울맞이\n이모티콘 선물!"
        descriptionInView.font = UIFont(descriptor: UIFontDescriptor(), size: 25)
        descriptionInView.sizeToFit()
        descriptionInView.numberOfLines = 3
        descriptionInView.translatesAutoresizingMaskIntoConstraints = false
        descriptionInView.topAnchor.constraint(equalTo: titleInView.bottomAnchor, constant: 30).isActive = true
        descriptionInView.leadingAnchor.constraint(equalTo: titleInView.leadingAnchor).isActive = true
    }
}

class MyView : UIView {
    func mySetting() {
        
    }
}
