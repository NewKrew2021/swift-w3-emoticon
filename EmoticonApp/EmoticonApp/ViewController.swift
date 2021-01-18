//
//  ViewController.swift
//  EmoticonApp
//
//  Created by Hochang Lee on 2021/01/18.
//

import UIKit

class ViewController: UIViewController {

    private var upperView = UIView()
    private var titleInView = UILabel()
    private var descriptionInView = UILabel()
    private var upperImageView = UIImageView()
    private var upperImage = UIImage(named: "basket")
    @IBOutlet weak var belowView: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.addSubview(upperView)
        upperView.translatesAutoresizingMaskIntoConstraints = false
        upperView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        upperView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 1/3).isActive = true
        upperView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        upperView.backgroundColor = UIColor(patternImage: UIImage(named: "pattern") ?? UIImage())
        
        belowView.translatesAutoresizingMaskIntoConstraints = false
        belowView.topAnchor.constraint(equalTo: upperView.bottomAnchor).isActive = true
        belowView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        belowView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
     
        upperView.addSubview(upperImageView)
        upperImageView.image = upperImage
        
        upperImageView.translatesAutoresizingMaskIntoConstraints = false
        upperImageView.topAnchor.constraint(equalTo: upperView.topAnchor).isActive = true
        upperImageView.bottomAnchor.constraint(equalTo: upperView.bottomAnchor).isActive = true
        upperImageView.leadingAnchor.constraint(equalTo: upperView.centerXAnchor).isActive = true
        upperImageView.trailingAnchor.constraint(equalTo: upperView.trailingAnchor).isActive = true
    }
}
