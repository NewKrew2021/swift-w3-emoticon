//
//  ViewController.swift
//  EmoticonApp
//
//  Created by 이청원 on 2021/01/18.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var topView: EmoticonTopView!
    @IBOutlet weak var emoticonTable: UITableView!
    private let emoticon = Emoticon()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "cart.fill"), style: .plain, target: self, action: #selector(clickedCartButton))
        
        topView.initView()
        
        emoticonTable.delegate = self
        emoticonTable.dataSource = self
    }

    @objc func clickedCartButton() {
        guard let cartViewController = self.storyboard?.instantiateViewController(withIdentifier: "cartViewController") else { return }
        self.navigationController?.pushViewController(cartViewController, animated: true)
    }
}

extension ViewController : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = emoticonTable.dequeueReusableCell(withIdentifier: "emoticonTableCell", for: indexPath) as! EmoticonTableViewCell
        
        cell.setData(title: emoticon.title(index: indexPath.row), author: emoticon.author(index: indexPath.row), image: emoticon.image(index: indexPath.row))
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.emoticon.size
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
}
