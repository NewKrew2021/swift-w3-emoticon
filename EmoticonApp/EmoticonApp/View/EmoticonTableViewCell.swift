//
//  EmoticonTableViewCell.swift
//  EmoticonApp
//
//  Created by 이청원 on 2021/01/18.
//

import UIKit

class EmoticonTableViewCell: UITableViewCell {

    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var author: UILabel!
    @IBOutlet weak var emoticonImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setTitle(text: String) {
        title.text = text
    }
    
    func setAuthor(text: String) {
        author.text = text
    }
    
    func setImage(image: UIImage) {
        emoticonImage.image = image
    }
}
