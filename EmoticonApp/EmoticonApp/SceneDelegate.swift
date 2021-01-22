//
//  SceneDelegate.swift
//  EmoticonApp
//
//  Created by bean Milky on 2021/01/18.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?
    var rootVC: MainViewController?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let _ = (scene as? UIWindowScene) else { return }
        rootVC = self.window?.rootViewController as? MainViewController
    }
    
    func sceneWillResignActive(_ scene: UIScene) {
        if let cart: CartType = rootVC?.cart {
            cart.synchronizeDataWithUserDefaults()
        }
    }
}
