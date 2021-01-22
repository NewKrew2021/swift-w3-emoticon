//
//  ViewController.swift
//  EmoticonApp
//
//  Created by 윤준수 on 2021/01/18.
//

import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet weak var emoticonList: UITableView!
    
    private let emoticonService: EmoticonService = EmoticonServiceImpl.instance
    
    private let upperView = MainImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initView()
    }
    
    func initView() {
        initUpperView()
        initTableView()
    }
    
    func initUpperView() {
        view.addSubview(upperView)
        upperView.translatesAutoresizingMaskIntoConstraints = false
        upperView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 15).isActive = true
        upperView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        upperView.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -30).isActive = true
        upperView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.2).isActive = true
        guard let patternImgage = UIImage(named: "pattern") else { return }
        upperView.backgroundColor = UIColor(patternImage: patternImgage)
        upperView.initself()
    }
    
    func initTableView() {
        view.addSubview(emoticonList)
        emoticonList.rowHeight = 70
        emoticonList.translatesAutoresizingMaskIntoConstraints = false
        emoticonList.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        emoticonList.topAnchor.constraint(equalTo: upperView.bottomAnchor, constant: 10).isActive = true
        emoticonList.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        emoticonList.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let cartViewController = segue.destination as? CartViewController else { return }
        cartViewController.setCartService(cartService: CartServiceImpl.instance)
    }
}

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return emoticonService.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "emoticonCell", for: indexPath) as! EmoticonCell//!를 없앨 방법 고민해보자
        let emoticon = emoticonService[indexPath.row]
        cell.setCell(emoticon: emoticon)
        return cell
    }
}
