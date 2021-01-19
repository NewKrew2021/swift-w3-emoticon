//
//  MainViewController.swift
//  EmoticonApp
//
//  Created by bean Milky on 2021/01/18.
//

import UIKit

class MainViewController: UIViewController {

    private var mainImage: UIView!
    private var myTableView: UITableView!
    let items: [String] = ["magi82", "swift", "ios"]
    let screenWidth = UIScreen.main.bounds.size.width
    let screenHeight = UIScreen.main.bounds.size.height

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = false
        setUI()
    }

    private func setUI() {
        setMainImage()
        setTableView()
    }
    private func setMainImage() {
        self.mainImage = Promotion(frame: CGRect(x: 0, y: self.topbarHeight, width: screenWidth-20, height: 230))
        self.view.addSubview(mainImage)
        self.mainImage.center.x = self.view.center.x
    }

    private func setTableView() {
        self.myTableView = UITableView(frame: CGRect(x: 0, y: self.topbarHeight+mainImage.frame.height+20, width: self.screenWidth, height: self.screenHeight-self.mainImage.frame.height))

        myTableView.dataSource = self
        myTableView.delegate = self
        myTableView.register(UITableViewCell.self, forCellReuseIdentifier: "TableViewCell")
        myTableView.layer.borderWidth = 1
        view.addSubview(self.myTableView)
    }
}

extension MainViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    print(items[indexPath.row])
  }
}

extension MainViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return self.items.count
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    if let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as? UITableViewCell {
        cell.textLabel?.text = items[indexPath.row]
        return cell
    }
    return UITableViewCell()
  }
}
