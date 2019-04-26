//
//  BaseSideBarViewController.swift
//  TaxoDriverApp
//
//  Created by Sonam on 10/04/19.
//  Copyright © 2019 Sonam. All rights reserved.
//

import UIKit

class BaseSideBarViewController: UIViewController {

    @IBOutlet weak var trailingConstraint: NSLayoutConstraint!
    var sideMenuOpen = false
//    let rightBarButtonItem: UIBarButtonItem = {
//        let barButtonItem = UIBarButtonItem(title: "Item", style: .plain, target: self, action: nil)
//        barButtonItem.tintColor = UIColor.blue
//        return barButtonItem
//    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(toggleSideMenu), name: NSNotification.Name("Toggle"), object: nil)
        
        self.title = "Home"
        let button1 = UIBarButtonItem(image: UIImage(named: "menu_icon"), style: .plain, target: self, action:#selector(action_menuBtn))
        // action:#selector(Class.MethodName) for swift 3
        self.navigationItem.rightBarButtonItem  = button1
        
        //add swipe gestures
        let leftSwipe = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipes(_:)))
        let rightSwipe = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipes(_:)))
        
        leftSwipe.direction = .left
        rightSwipe.direction = .right
        
        self.view.addGestureRecognizer(leftSwipe)
        self.view.addGestureRecognizer(rightSwipe)
    }
    
    @objc func action_menuBtn(){
        NotificationCenter.default.post(name: NSNotification.Name("Toggle"), object: nil)
    }
    
    @objc func handleSwipes(_ sender:UISwipeGestureRecognizer) {
        if (sender.direction == .left) {
            trailingConstraint.constant = 0
            sideMenuOpen = true
            
        }
        if (sender.direction == .right) {
            trailingConstraint.constant = 240
            sideMenuOpen = false
        }
        UIView.animate(withDuration: 0.3) {
            self.view.layoutIfNeeded()
        }
    }
    
    
    @objc func toggleSideMenu(){
        if sideMenuOpen{
            trailingConstraint.constant = 240
            sideMenuOpen = false
            
        }else {
            trailingConstraint.constant = 0
            sideMenuOpen = true
        }
        UIView.animate(withDuration: 0.3) {
            self.view.layoutIfNeeded()
        }
    }
}

