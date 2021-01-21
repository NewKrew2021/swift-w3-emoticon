//
//  CartCell.swift
//  EmoticonApp
//
//  Created by Hochang Lee on 2021/01/20.
//

import UIKit

class CartCell: UITableViewCell {
    
    private var deleteButton = UIButton()
    private var standardHeight : CGFloat?
    private var standardWidth : CGFloat?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        standardHeight = standardHeight == nil ? frame.height : standardHeight
        setConstraints()
        addSwipeRecognizer()
    }
    
    func addSwipeRecognizer() {
        let swipeRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(historySwiped(_:)))
        swipeRecognizer.direction = .left
        swipeRecognizer.numberOfTouchesRequired = 1
        addGestureRecognizer(swipeRecognizer)
    }
    
    @objc func historySwiped(_ sender : UISwipeGestureRecognizer) {
        guard let height = standardHeight else { return }
        
        addSubview(deleteButton)
        detailTextLabel?.trailingAnchor.constraint(equalTo: deleteButton.leadingAnchor, constant: 0).isActive = true
        deleteButton.setTitle("Delete", for: .normal)
        deleteButton.setTitleColor(.systemRed, for: .normal)
        deleteButton.translatesAutoresizingMaskIntoConstraints = false
        deleteButton.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 2/3).isActive = true
        deleteButton.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        deleteButton.leadingAnchor.constraint(equalTo: trailingAnchor, constant: -height * 1.5).isActive = true
        deleteButton.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        deleteButton.addTarget(self, action: #selector(deleteButtonTouched), for: .touchUpInside)
    }
    
    @objc func deleteButtonTouched() {
        detailTextLabel?.removeConstraint(NSLayoutConstraint())
        deleteButton.removeFromSuperview()
        guard let tempTextLabel = textLabel else { return }
        guard let tempDetailTextLabel = detailTextLabel else { return }
        NotificationCenter.default.post(name: .historySwiped, object: nil, userInfo: ["title" : tempTextLabel.text ?? "", "time" : tempDetailTextLabel.text ?? ""])
    }
        
    func setHistory(history : History) {
        textLabel?.text = history.title
        detailTextLabel?.text = history.time
    }
    
    func setConstraints() {
        guard let height = standardHeight else { return }
        textLabel?.translatesAutoresizingMaskIntoConstraints = false
        textLabel?.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        textLabel?.leadingAnchor.constraint(equalTo: leadingAnchor, constant: height/8).isActive = true
        textLabel?.sizeToFit()
        
        detailTextLabel?.translatesAutoresizingMaskIntoConstraints = false
        detailTextLabel?.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        detailTextLabel?.heightAnchor.constraint(lessThanOrEqualTo: heightAnchor).isActive = true
        detailTextLabel?.leadingAnchor.constraint(greaterThanOrEqualTo: textLabel!.trailingAnchor, constant: height * 0.5).isActive = true
        detailTextLabel?.trailingAnchor.constraint(lessThanOrEqualTo: trailingAnchor).isActive = true
        
    }
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}


