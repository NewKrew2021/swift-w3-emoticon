//
//  EmoticonCell.swift
//  EmoticonApp
//
//  Created by 윤준수 on 2021/01/18.
//

import UIKit

class EmoticonCell: UITableViewCell {

    @IBOutlet weak var _thumbnail: UIImageView!
    var thumbnail: UIImage? {
        get {
            return _thumbnail.image
        }
        set {
            _thumbnail.image = newValue
        }
    }
    @IBOutlet weak var _title: UILabel!
    var title: String? {
        get {
            return _title.text
        }
        set {
            _title.text = newValue
        }
    }
    @IBOutlet weak var _author: UILabel!
    var author: String? {
        get {
            return _author.text
        }
        set {
            _author.text = newValue
        }
    }
}
