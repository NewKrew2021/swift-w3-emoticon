//
//  CartCell.swift
//  EmoticonApp
//
//  Created by Hochang Lee on 2021/01/20.
//

import UIKit

class CartCell: UITableViewCell {
    
    private var titleLabel = UILabel()
    private var timeLabel = UILabel()
    private var standardHeight : CGFloat?
    private var standardWidth : CGFloat?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        addSubview(titleLabel)
        addSubview(timeLabel)
        standardHeight = standardHeight == nil ? frame.height : standardHeight
        standardWidth = standardWidth == nil ? frame.width : standardWidth
        setConstraints()
    }
        
    func setHistory(history : History) {
        titleLabel.text = history.title
        timeLabel.text = history.time
    }
    
    func setConstraints() {
        guard let height = standardHeight else { return }
        guard let width = standardWidth else { return }
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: height/8).isActive = true
        titleLabel.sizeToFit()
        
        timeLabel.translatesAutoresizingMaskIntoConstraints = false
        timeLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        timeLabel.heightAnchor.constraint(lessThanOrEqualTo: heightAnchor).isActive = true
        timeLabel.leadingAnchor.constraint(equalTo: titleLabel.trailingAnchor, constant: height * 0.5).isActive = true
//        timeLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: width * 0.3).isActive = true
//        timeLabel.leadingAnchor.constraint(equalTo: titleLabel.trailingAnchor).isActive = true
//        timeLabel.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        
    }
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
