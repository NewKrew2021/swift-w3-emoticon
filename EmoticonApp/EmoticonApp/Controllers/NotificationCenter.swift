//
//  NotificationCenter.swift
//  EmoticonApp
//
//  Created by bean Milky on 2021/01/21.
//

import UIKit

extension Notification.Name {
    static let pushToCart = Notification.Name("pushToCart")
    static let clearCart = Notification.Name("clearCart")
}

protocol Observable {
    var sender: Any { get }
    func addObserver(name: Notification.Name, selector aSelector: Selector)
    func addObserver(name: Notification.Name, queue: OperationQueue, using: @escaping (Notification) -> Void)
    func removeObserver(name: Notification.Name)
    func removeObservers()
}

class CartObserver: Observable {
    let sender: Any

    init(_ sender: Any) {
        self.sender = sender
    }
    
    func addObserver(name: Notification.Name, selector aSelector: Selector) {
        NotificationCenter.default.addObserver(sender, selector: aSelector, name: name, object: nil)
    }
    func addObserver(name: Notification.Name, queue: OperationQueue, using: @escaping (Notification) -> Void) {
        NotificationCenter.default.addObserver(forName: name, object: nil, queue: queue, using: using)
    }
    
    func removeObserver(name: Notification.Name) {
        NotificationCenter.default.removeObserver(sender, name: name, object: nil)
    }
    func removeObservers() {
        NotificationCenter.default.removeObserver(sender)
    }
}
