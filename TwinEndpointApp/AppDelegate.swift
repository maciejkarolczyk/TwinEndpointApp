//
//  AppDelegate.swift
//  TwinEndpointApp
//
//  Created by Karolczyk, Maciej on 19/11/2020.
//

import UIKit
import MultiNetworking

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        self.window = UIWindow(frame: UIScreen.main.bounds)
        let navigation = UINavigationController()
        let controller = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "UsersTableViewController") { coder in
            return UsersTableViewController(coder: coder, networkLayer: MultiNetworkingManager())
        }
        navigation.addChild(controller)
        window?.rootViewController = navigation
        window?.makeKeyAndVisible()
        return true
    }
}

