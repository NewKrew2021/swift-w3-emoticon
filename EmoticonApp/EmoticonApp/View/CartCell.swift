//
//  CartCell.swift
//  EmoticonApp
//
//  Created by Hochang Lee on 2021/01/20.
//

import UIKit

class CartCell: UITableViewCell {
    
    private var standardHeight : CGFloat?
    private var standardWidth : CGFloat?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
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
        guard let width = standardWidth else { return }
        textLabel?.translatesAutoresizingMaskIntoConstraints = false
        textLabel?.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        textLabel?.leadingAnchor.constraint(equalTo: leadingAnchor, constant: height/8).isActive = true
        textLabel?.sizeToFit()
        
        detailTextLabel?.translatesAutoresizingMaskIntoConstraints = false
        detailTextLabel?.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        detailTextLabel?.heightAnchor.constraint(lessThanOrEqualTo: heightAnchor).isActive = true
        detailTextLabel?.leadingAnchor.constraint(greaterThanOrEqualTo: textLabel!.trailingAnchor, constant: height * 0.5).isActive = true
        detailTextLabel?.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        
    }
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}


