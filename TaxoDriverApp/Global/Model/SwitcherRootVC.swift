//
//  SwitcherRootVC.swift
//  TaxoDriverApp
//
//  Created by Sonam on 10/04/19.
//  Copyright © 2019 Sonam. All rights reserved.
//

import Foundation
import UIKit

class SwitcherRootVC {
    
    static func updateRootVC() {
        let status  = UserDefaults.standard.bool(forKey: Constants.isUserLogin)
        
        var rootVC :UIViewController?
        print(status)
        
        if(status == true){
            rootVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "BaseSideBarViewController") as! BaseSideBarViewController
        }else {
           rootVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "FirstPageViewController") as! FirstPageViewController
        }
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let  navController = UINavigationController(rootViewController: rootVC!)
        appDelegate.window?.rootViewController = navController
        
    }
    
}
