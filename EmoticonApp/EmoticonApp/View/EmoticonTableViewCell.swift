//
//  EmoticonTableViewCell.swift
//  EmoticonApp
//
//  Created by 이청원 on 2021/01/18.
//

import UIKit

class EmoticonTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var emoticonImage: UIImageView!
    
    func setData(title:String, author:String, image:UIImage) {
        titleLabel.text = title
        authorLabel.text = author
        emoticonImage.image = image
    }
}
