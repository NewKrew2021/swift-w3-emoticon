//
//  UpperView.swift
//  EmoticonApp
//
//  Created by Hochang Lee on 2021/01/20.
//

import UIKit

class UpperView: UIView {

    private var upperInnerView = UIView()
    private var upperImage = UIImage()
    private var upperImageView = UIImageView()
    private var titleInView = UILabel()
    private var descriptionInView = UILabel()
    

    func setUpperView(standardView : UIView) {
        translatesAutoresizingMaskIntoConstraints = false
        topAnchor.constraint(equalTo: standardView.safeAreaLayoutGuide.topAnchor).isActive = true
        heightAnchor.constraint(equalTo: standardView.heightAnchor, multiplier: 1/3).isActive = true
        widthAnchor.constraint(equalTo: standardView.widthAnchor).isActive = true
        
        addSubview(upperInnerView)
    }
    
    func setUpperInnerView(padding : CGFloat) {
        upperInnerView.translatesAutoresizingMaskIntoConstraints = false
        upperInnerView.topAnchor.constraint(equalTo: self.topAnchor, constant: padding).isActive = true
        upperInnerView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -padding).isActive = true
        upperInnerView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: padding).isActive = true
        upperInnerView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -padding).isActive = true
        upperInnerView.backgroundColor = UIColor(patternImage: UIImage(named: "pattern") ?? UIImage())
        
        upperInnerView.addSubview(upperImageView)
    }
    
    func setUpperImage(named : String) {
        upperImage = UIImage(named: named) ?? UIImage()
    }
    
    func getUpperInnerView() -> UIView {
        return upperInnerView
    }
    
    func setUpperImageView() {
        let superView = getUpperInnerView()
        superView.addSubview(upperImageView)
        upperImageView.image = upperImage
        upperImageView.translatesAutoresizingMaskIntoConstraints = false
        upperImageView.topAnchor.constraint(equalTo: superView.topAnchor).isActive = true
        upperImageView.bottomAnchor.constraint(equalTo: superView.bottomAnchor).isActive = true
        upperImageView.leadingAnchor.constraint(equalTo: superView.centerXAnchor).isActive = true
        upperImageView.trailingAnchor.constraint(equalTo: superView.trailingAnchor).isActive = true
        upperImageView.contentMode = .scaleAspectFit
    }
    
    func setTitleInView() {
        let superView = getUpperInnerView()
        superView.addSubview(titleInView)
        titleInView.text = "이벤트"
        titleInView.textColor = UIColor(red: 0, green: 125/255, blue: 1, alpha: 1)
        titleInView.font = UIFont(descriptor: UIFontDescriptor(), size: 20)
        titleInView.translatesAutoresizingMaskIntoConstraints = false
        titleInView.topAnchor.constraint(equalTo: superView.topAnchor, constant: 10).isActive = true
        titleInView.leadingAnchor.constraint(equalTo: superView.leadingAnchor, constant: 10).isActive = true
        titleInView.heightAnchor.constraint(equalToConstant: 30).isActive = true
        titleInView.widthAnchor.constraint(equalToConstant: 100).isActive = true
    }
    
    func getTitleInView() -> UILabel {
        return titleInView
    }
    
    func setDescriptionInView() {
        let superView = getUpperInnerView()
        let standardView = getTitleInView()
        superView.addSubview(descriptionInView)
        descriptionInView.text = "친구 추가하면\n겨울맞이\n이모티콘 선물!"
        descriptionInView.font = UIFont(descriptor: UIFontDescriptor(), size: 25)
        descriptionInView.sizeToFit()
        descriptionInView.numberOfLines = 3
        descriptionInView.translatesAutoresizingMaskIntoConstraints = false
        descriptionInView.topAnchor.constraint(equalTo: standardView.bottomAnchor, constant: 30).isActive = true
        descriptionInView.leadingAnchor.constraint(equalTo: standardView.leadingAnchor).isActive = true
    }

}

extension UIView {
    func setBelowView(upperView : UpperView, superView : UIView) {
        translatesAutoresizingMaskIntoConstraints = false
        topAnchor.constraint(equalTo: upperView.bottomAnchor).isActive = true
        bottomAnchor.constraint(equalTo: superView.safeAreaLayoutGuide.bottomAnchor).isActive = true
        widthAnchor.constraint(equalTo: superView.widthAnchor).isActive = true
    }
}
