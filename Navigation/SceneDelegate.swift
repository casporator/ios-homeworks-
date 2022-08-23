//
//  SceneDelegate.swift
//  Navigation
//
//  Created by Oleg Popov on 15.08.2022.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    var feedTabNavigationController : UINavigationController!
    var profileTabNavigationController : UINavigationController!

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
                
        // 1. создаем TabBarController
        let tabBarController = UITabBarController()
        
        // 2. создаем 2 контейнера и присваиваем им нужные представления ViewController
        
        feedTabNavigationController = UINavigationController.init(rootViewController: FeedViewController())
        profileTabNavigationController = UINavigationController.init(rootViewController: ProfileViewController())
        
        tabBarController.viewControllers = [feedTabNavigationController, profileTabNavigationController]
        
        // настраиваем кнопки таббара
        let item1 = UITabBarItem(title: "Профиль", image: UIImage(systemName: "person.crop.circle"), tag: 1)
        let item2 = UITabBarItem(title: "Лента", image: UIImage(systemName: "rectangle.3.group.bubble.left"), tag: 0)
        
        profileTabNavigationController.tabBarItem = item1
        feedTabNavigationController.tabBarItem = item2
        
        
        
        // визуальные настройки таббара
        UITabBar.appearance().tintColor = .systemBlue
        UITabBar.appearance().backgroundColor = .white
        
        let window = UIWindow(windowScene: windowScene)
        window.rootViewController = tabBarController
        window.makeKeyAndVisible()
        self.window = window
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
       
    }

    func sceneWillResignActive(_ scene: UIScene) {
       
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        
    }


}

