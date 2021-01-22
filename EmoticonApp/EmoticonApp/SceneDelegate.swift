//
//  SceneDelegate.swift
//  EmoticonApp
//
//  Created by 지현우 on 2021/01/18.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window?.windowScene = windowScene

        let vc = EmoticonViewController()
        let navVC = UINavigationController(rootViewController: vc)
        window?.rootViewController = navVC
        window?.makeKeyAndVisible()
    }

    func sceneDidDisconnect(_ scene: UIScene) {}

    func sceneDidBecomeActive(_ scene: UIScene) {}

    func sceneWillResignActive(_ scene: UIScene) {
        Cart.shared.saveEmoticons()
    }

    func sceneWillEnterForeground(_ scene: UIScene) {}

    func sceneDidEnterBackground(_ scene: UIScene) {}
}
