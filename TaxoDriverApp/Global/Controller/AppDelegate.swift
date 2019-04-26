//
//  AppDelegate.swift
//  TaxoDriverApp
//
//  Created by Sonam on 03/04/19.
//  Copyright © 2019 Sonam. All rights reserved.
//

import UIKit
import IQKeyboardManagerSwift
import GoogleMaps


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        self .setNavigationBarColor()
        SwitcherRootVC.updateRootVC()
        GMSServices.provideAPIKey(Constants.GOOGLE_API_KEY)
        IQKeyboardManager.shared.enable = true
        IQKeyboardManager.shared.enableAutoToolbar = false
        IQKeyboardManager.shared.previousNextDisplayMode = .alwaysHide
        IQKeyboardManager.shared.shouldResignOnTouchOutside = true
      

     return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
    }

    func applicationWillTerminate(_ application: UIApplication) {
    }
    
    func setNavigationBarColor(){
        let navigationBarAppearace = UINavigationBar.appearance()
        navigationBarAppearace.barTintColor = UIColor(red: 251/255, green: 132/255, blue: 0/255, alpha: 1)
        navigationBarAppearace.titleTextAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
        navigationBarAppearace.tintColor = UIColor.white
        
        let backImage = UIImage(named: "back")?.withRenderingMode(.alwaysOriginal)
        navigationBarAppearace.backIndicatorImage = backImage
        navigationBarAppearace.backIndicatorTransitionMaskImage = backImage
        UIBarButtonItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.clear], for: .normal)
        UIBarButtonItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.clear], for: .highlighted)
    }
}

