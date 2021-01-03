//
//  SceneDelegate.swift
//  SnapKitPractice
//
//  Created by Beomcheol Kwon on 2021/01/01.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let _ = (scene as? UIWindowScene) else { return }
        
//        self.window = UIWindow(windowScene: scene)
        let vc1 = ViewController()
        let vc2 = SnpViewController()
        let vc3 = ThenViewController()
        let nav1 = UINavigationController(rootViewController: vc1)
        let nav2 = UINavigationController(rootViewController: vc2)
        let nav3 = UINavigationController(rootViewController: vc3)
        let tab = UITabBarController()
        tab.viewControllers = [nav1, nav2, nav3]
        tab.selectedIndex = 0
        
        nav1.tabBarItem.title = "UIKit"
        nav1.tabBarItem.image = UIImage(systemName: "house.fill")

        nav2.tabBarItem.title = "SnapKit"
        nav2.tabBarItem.image = UIImage(systemName: "house")
        
        nav3.tabBarItem.title = "Then"
        nav3.tabBarItem.image = UIImage(systemName: "star")
        
        self.window?.rootViewController = tab
        self.window?.makeKeyAndVisible()
        
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }


}

