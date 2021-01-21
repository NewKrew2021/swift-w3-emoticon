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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "cart.fill"), style: .plain, target: self, action: #selector(clickedCartButton))
        
        NotificationCenter.default.addObserver(self,
                    selector: #selector(buyEmoticon),
                    name: NSNotification.Name(rawValue: "purchaseButton"),
                    object: nil)
        
        topView.initView()
        
        emoticonTable.delegate = self
        emoticonTable.dataSource = self
    }

    @objc func clickedCartButton() {
        guard let cartViewController = self.storyboard?.instantiateViewController(withIdentifier: "cartViewController") else { return }
        self.navigationController?.pushViewController(cartViewController, animated: true)
    }
    
    @objc func buyEmoticon(_ notification:Notification) {
        let history = notification.object as! History
        Cart.add(history: history)
        showAlert(controller: self, message: "구매되었습니다", seconds: 0.4)
    }
}

extension ViewController : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = emoticonTable.dequeueReusableCell(withIdentifier: "emoticonTableCell", for: indexPath) as! EmoticonTableViewCell
        
        cell.setData(title: Emoticon.title(index: indexPath.row), author: Emoticon.author(index: indexPath.row), image: Emoticon.image(index: indexPath.row))
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Emoticon.size
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
}
