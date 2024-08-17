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
