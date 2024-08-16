//
//  AppDelegate.swift
//  app-coordinator
//
//  Created by Leonardo Veiga on 15/08/24.
//

import UIKit
import Foundation
import core_utility

open class AppDelegate: UIResponder, UIApplicationDelegate, AppCoordinatorProtocol {
    public var window: UIWindow?
    var coordinator: Coordinator?
    public let presenter = UINavigationController()
    public var appCoordinator: FeatureCoordinatorDelegate!
    var orientationLock = UIInterfaceOrientationMask.portrait

    public func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        setupRootWindow()
        return true
    }
    
    // MARK: UISceneSession Lifecycle
    
//    public func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
//        // Called when a new scene session is being created.
//        // Use this method to select a configuration to create the new scene with.
//        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
//    }
    
//    public func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
//        // Called when the user discards a scene session.
//        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
//        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
//    }
    
    // MARK: - RootWindow
    open func setupRootWindow() {
        let window = self.window ?? UIWindow(frame: UIScreen.main.bounds)
        let appCoordinator = MainCoordinator(window: window, presenter: presenter)
        self.window = window
        self.appCoordinator = appCoordinator
        appCoordinator.start()
        window.makeKeyAndVisible()
    }
}
