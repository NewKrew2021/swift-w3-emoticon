//
//  myCell.swift
//  EmoticonApp
//
//  Created by Hochang Lee on 2021/01/19.
//

import UIKit

class myCell: UITableViewCell {
    
    private var titleLabel = UILabel()
    private var descriptionLabel = UILabel()
    private var leadingImage = UIImageView()

    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        addSubview(titleLabel)
        addSubview(descriptionLabel)
        addSubview(leadingImage)
        titleLabel.setConstraint(target: .title, standardView: self, top: 0, bottom: 0, leading: 0, trailing: 0)
        // Configure the view for the selected state
    }
    
    func setTitleText(text : String) {
        titleLabel.text = text
    }
    
    func setDescriptionText(text : String) {
        descriptionLabel.text = text
    }
    
    func setImage(src : String) {
        leadingImage.image = UIImage(named: src)
    }

}

extension UILabel {
    enum labelType {
        case title
        case description
    }
    
    func setConstraint(target: labelType, standardView : UIView, top : CGFloat, bottom : CGFloat, leading : CGFloat, trailing : CGFloat) {
        translatesAutoresizingMaskIntoConstraints = false
        sizeToFit()
        topAnchor.constraint(equalTo: standardView.topAnchor, constant: top).isActive = true
        bottomAnchor.constraint(equalTo: standardView.bottomAnchor, constant: bottom).isActive = true
        leadingAnchor.constraint(equalTo: standardView.leadingAnchor, constant: leading).isActive = true
        trailingAnchor.constraint(equalTo: standardView.trailingAnchor, constant: trailing).isActive = true
    }
}

extension UIImageView {
    
}
