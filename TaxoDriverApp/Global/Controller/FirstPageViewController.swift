//
//  FirstPageViewController.swift
//  TaxoDriverApp
//
//  Created by Sonam on 03/04/19.
//  Copyright © 2019 Sonam. All rights reserved.
//

import UIKit

class FirstPageViewController: UIViewController {

    @IBOutlet weak var loginbtn: UIButton!
  
    override func viewDidLoad() {
        super.viewDidLoad()
        loginbtn.layer.borderWidth = 1.0
        loginbtn.layer.borderColor = (UIColor( red: 54.0/240.0, green: 63.0/240.0, blue:70.0/240.0, alpha: 1.0 )).cgColor
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
  
}
