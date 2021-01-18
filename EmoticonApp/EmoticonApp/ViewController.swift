//
//  ViewController.swift
//  EmoticonApp
//
//  Created by Hochang Lee on 2021/01/18.
//

import UIKit

class ViewController: UIViewController {

    private var upperView = UIView()
    @IBOutlet weak var belowView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.addSubview(upperView)
        upperView.translatesAutoresizingMaskIntoConstraints = false
        upperView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        upperView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 1/3).isActive = true
        upperView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        
        belowView.translatesAutoresizingMaskIntoConstraints = false
        belowView.topAnchor.constraint(equalTo: upperView.bottomAnchor).isActive = true
        belowView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        belowView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
    }
}
