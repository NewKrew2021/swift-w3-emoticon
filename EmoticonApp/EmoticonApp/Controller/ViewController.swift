//
//  ViewController.swift
//  EmoticonApp
//
//  Created by Hochang Lee on 2021/01/18.
//

import UIKit

class ViewController: UIViewController {

    private var upperView = UpperView()
    @IBOutlet weak var belowView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setNavigationItem()

        view.addSubview(upperView)
        upperView.setUpperView(standardView: view)
        upperView.setUpperInnerView(padding: CGFloat(20))
        upperView.setUpperImage(named: "basket")
        upperView.setUpperImageView()
        upperView.setTitleInView()
        upperView.setDescriptionInView()
        
        belowView.setBelowView(upperView: upperView, superView: view)
    }
    
    func setNavigationItem() {
        let item = UIBarButtonItem(image: UIImage(systemName: "cart.fill"), style: .plain, target: self, action: #selector(cartButtonTouched))
        self.navigationController?.navigationBar.topItem?.title = "emoticon"
        self.navigationItem.setRightBarButton(item, animated: true)
    }
    
    @objc func cartButtonTouched() {
        guard let nextController = storyboard?.instantiateViewController(withIdentifier: "HitsoryTableViewController") else {  return }
        navigationController?.pushViewController(nextController, animated: true)
    }

}
