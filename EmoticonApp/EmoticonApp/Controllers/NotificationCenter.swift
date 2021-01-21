//
//  NotificationCenter.swift
//  EmoticonApp
//
//  Created by bean Milky on 2021/01/21.
//

import UIKit

extension Notification.Name {
    static let pushToCart = Notification.Name("pushToCart")
}

protocol Observable {
    var sender: Any { get }
    func removeObserver(name: Notification.Name)
    func removeObservers()
}

class CartObserver: Observable {
    let sender: Any

    init(_ sender: Any, selector aSelctor: Selector) {
        self.sender = sender
        NotificationCenter.default.addObserver(sender, selector: aSelctor, name: .pushToCart, object: nil)
    }

    func removeObserver(name: Notification.Name) {
        NotificationCenter.default.removeObserver(sender, name: name, object: nil)
    }
    func removeObservers() {
        NotificationCenter.default.removeObserver(sender)
    }
}
