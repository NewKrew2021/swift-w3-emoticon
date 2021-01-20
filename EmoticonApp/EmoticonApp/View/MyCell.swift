//
//  myCell.swift
//  EmoticonApp
//
//  Created by Hochang Lee on 2021/01/19.
//

import UIKit

class MyCell: UITableViewCell {
    
    private var titleLabel = UILabel()
    private var authorLabel = UILabel()
    var purchaseButton = UIButton()
    private var leadingImage = UIImageView()
    private var standardHeight : CGFloat?

    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        addSubview(leadingImage)
        addSubview(titleLabel)
        addSubview(authorLabel)
        addSubview(purchaseButton)
        setConstraints()
        standardHeight = standardHeight == nil ? frame.height : standardHeight
    }
    
    func setEmoticon(emoticon : Emoticon) {
        titleLabel.text = emoticon.title
        authorLabel.text = emoticon.author
        leadingImage.image = UIImage(named: emoticon.image)
    }
    
    func setConstraints() {
        guard let height = standardHeight else { return }
        titleLabel.setConstraint(target: .title, standardView: leadingImage, height : height)
        authorLabel.setConstraint(target: .description, standardView: leadingImage, height: height)
        leadingImage.setConstraint(standardView: self, height: height)
        setPurchaseButton(standardView : self, height : height)
    }
    
    func setPurchaseButton(standardView : UIView, height : CGFloat) {
        purchaseButton.translatesAutoresizingMaskIntoConstraints = false
        purchaseButton.leadingAnchor.constraint(equalTo: standardView.trailingAnchor, constant : -1.2 * height).isActive = true
        purchaseButton.centerYAnchor.constraint(equalTo: standardView.centerYAnchor).isActive = true
        purchaseButton.setTitle("구매", for: .normal)
        purchaseButton.setTitleColor(.systemBlue, for: .normal)
        purchaseButton.addTarget(self, action: #selector(buyButtonTouched), for: .touchUpInside)
    }
    
    @objc func buyButtonTouched() {
        let titleText = titleLabel.text!
        let history = History(title: titleText, time: "2020-11-24 09:51:37 + 0000")
        NotificationCenter.default.post(name: .buyButtonTouched, object: nil, userInfo: ["history" : history])
    }
}
extension UILabel {
    enum labelType {
        case title
        case description
    }
    
    func setConstraint(target: labelType, standardView : UIView, height : CGFloat) {
        translatesAutoresizingMaskIntoConstraints = false
        let padding = height/8
        sizeToFit()
        switch target {
        case .title:
            leadingAnchor.constraint(equalTo: standardView.trailingAnchor, constant: 2 * padding).isActive = true
            topAnchor.constraint(equalTo: standardView.topAnchor, constant: padding).isActive = true
            break
        case .description:
            leadingAnchor.constraint(equalTo: standardView.trailingAnchor, constant: 2 * padding).isActive = true
            topAnchor.constraint(equalTo: standardView.centerYAnchor, constant: padding).isActive = true
            textColor = .gray
            break
            
        }
    }
}

extension UIImageView {
    func setConstraint(standardView : UIView, height : CGFloat) {
        translatesAutoresizingMaskIntoConstraints = false
        let padding = height/8
        centerYAnchor.constraint(equalTo: standardView.centerYAnchor).isActive = true
        heightAnchor.constraint(equalTo: standardView.heightAnchor, constant: -2 * padding).isActive = true
        leadingAnchor.constraint(equalTo: standardView.leadingAnchor, constant: padding).isActive = true
        widthAnchor.constraint(equalTo: standardView.heightAnchor, constant: -2 * padding).isActive = true
    }
}
