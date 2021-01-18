//
//  ViewController.swift
//  EmoticonApp
//
//  Created by bean Milky on 2021/01/18.
//

import UIKit

class EmojiListViewController: UIViewController {

    var mainImage: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()

        setMainImage()

        self.navigationController?.navigationBar.isHidden = false
    }

    private func setMainImage() {
        let screenRect = UIScreen.main.bounds
        let screenWidth = screenRect.size.width
        let screenHeight = screenRect.size.height

        self.mainImage = MainImage(frame: CGRect(x: 0, y: self.topbarHeight, width: screenWidth, height: 230))
        self.view.addSubview(mainImage)

        /*
        Constraints Code
        
         mainImage.translatesAutoresizingMaskIntoConstraints = false
        mainImage.widthAnchor.constraint(equalToConstant: screenWidth).isActive = true
        mainImage.heightAnchor.constraint(equalToConstant: 230).isActive = true
        mainImage.topAnchor.constraint(equalTo: self.view.topAnchor, constant: self.topbarHeight).isActive = true
        */
    }

}
