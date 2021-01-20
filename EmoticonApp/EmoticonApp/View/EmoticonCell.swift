//
//  EmoticonCell.swift
//  EmoticonApp
//
//  Created by 윤준수 on 2021/01/18.
//

import UIKit

class EmoticonCell: UITableViewCell {

    @IBOutlet weak var thumbnail: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var author: UILabel!
    func setCell(emoticon: Emoticon) {
        thumbnail.image = UIImage(named: emoticon.image)
        title.text = emoticon.title
        title.sizeToFit()
        author.text = emoticon.author
        author.sizeToFit()
        
        thumbnail.translatesAutoresizingMaskIntoConstraints = false
        thumbnail.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        thumbnail.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        thumbnail.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10).isActive = true
    }
}
