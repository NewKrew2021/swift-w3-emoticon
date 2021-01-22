//
//  SceneDelegate.swift
//  EmoticonApp
//
//  Created by bean Milky on 2021/01/18.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?

    func sceneWillResignActive(_ scene: UIScene) {
        NotificationCenter.default.post(name: UIApplication.willResignActiveNotification, object: self)
    }
}
