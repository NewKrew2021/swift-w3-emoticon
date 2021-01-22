//
//  SceneDelegate.swift
//  EmoticonApp
//
//  Created by 윤준수 on 2021/01/18.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {  
        guard let _ = (scene as? UIWindowScene) else { return }
    }
    
    func sceneDidDisconnect(_ scene: UIScene) {
    }
    
    func sceneDidBecomeActive(_ scene: UIScene) {
    }
    
    
    func sceneWillResignActive(_ scene: UIScene) {
        let cartService: CartService = CartServiceImpl.instance
        do{
            let encodedData: Data = try NSKeyedArchiver.archivedData(withRootObject: cartService.products, requiringSecureCoding: false)
            UserDefaults.standard.set(encodedData, forKey: StringVO.cartProduct)
        }
        catch {
            print(error)
        }
    }
    
    func sceneWillEnterForeground(_ scene: UIScene) {
        guard let archievedData = UserDefaults.standard.value(forKey: StringVO.cartProduct) as? Data else { return }
        do {
            let unarchievedData = try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(archievedData)
            guard let products = unarchievedData as? [Product] else { return }
            CartServiceImpl.instance.setProducts(products: products)
        }
        catch {
            print(error)
        }
    }
    
    func sceneDidEnterBackground(_ scene: UIScene) {
    }
}

