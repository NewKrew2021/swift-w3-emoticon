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
    private var purchaseLabel = UILabel()
    private var leadingImage = UIImageView()
    private var standardHeight : CGFloat?

    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        addSubview(leadingImage)
        addSubview(titleLabel)
        addSubview(descriptionLabel)
        addSubview(purchaseLabel)
        setConstraints()
        contentView.layer.borderWidth = 1
        standardHeight = standardHeight == nil ? frame.height : standardHeight
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
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
    
    func setConstraints() {
        guard let height = standardHeight else { return }
        titleLabel.setConstraint(target: .title, standardView: leadingImage, height : height)
        descriptionLabel.setConstraint(target: .description, standardView: leadingImage, height: height)
        leadingImage.setConstraint(standardView: self, height: height)
        purchaseLabel.text = "구매"
        purchaseLabel.setConstraint(target: .purchase, standardView: self, height: height)
    }
}

extension UILabel {
    enum labelType {
        case title
        case description
        case purchase
    }
    
    func setConstraint(target: labelType, standardView : UIView, height : CGFloat) {
        translatesAutoresizingMaskIntoConstraints = false
        let padding = height/8
        sizeToFit()
        switch target {
        case .title:
            leadingAnchor.constraint(equalTo: standardView.trailingAnchor, constant: 2 * padding).isActive = true
            topAnchor.constraint(equalTo: standardView.topAnchor, constant: padding).isActive = true
            layer.borderWidth = 1
            break
        case .description:
            leadingAnchor.constraint(equalTo: standardView.trailingAnchor, constant: 2 * padding).isActive = true
            topAnchor.constraint(equalTo: standardView.centerYAnchor, constant: padding).isActive = true
            textColor = .gray
            layer.borderWidth = 1
            break
        case .purchase:
//            leadingAnchor.constraint(equalToSystemSpacingAfter: standardView.trailingAnchor, multiplier: 0.1).isActive = true
            leadingAnchor.constraint(equalTo: standardView.trailingAnchor, constant : -1.2 * height).isActive = true
            centerYAnchor.constraint(equalTo: standardView.centerYAnchor).isActive = true
            textColor = .systemBlue
            layer.borderWidth = 1
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
        layer.borderWidth = 1
    }
}
