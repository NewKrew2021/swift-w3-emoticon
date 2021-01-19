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
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "cart.fill"), style: .plain, target: self, action: #selector(cartButtonClicked))
        
        topView.loadView()
        
        emoticonTable.delegate = self
        emoticonTable.dataSource = self
        emoticonTable.rowHeight = 70
    }

    @objc func cartButtonClicked() {
        guard let cartViewController = self.storyboard?.instantiateViewController(withIdentifier: "cartViewController") else { return }
        self.navigationController?.pushViewController(cartViewController, animated: true)
    }
}

extension ViewController : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = emoticonTable.dequeueReusableCell(withIdentifier: "emoticonTableCell", for: indexPath) as! EmoticonTableViewCell
        
        cell.setTitle(text: emoticon.title(index: indexPath.row))
        cell.setAuthor(text: emoticon.author(index: indexPath.row))
        cell.setImage(image: emoticon.image(index: indexPath.row))
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.emoticon.size
    }
}
