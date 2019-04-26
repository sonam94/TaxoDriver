//
//  LoginViewController.swift
//  TaxoDriverApp
//
//  Created by Sonam on 09/04/19.
//  Copyright © 2019 Sonam. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    @IBOutlet weak var txt_loginNumber: CustomTextField!
    @IBOutlet weak var txt_password: CustomTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func action_loginBtn(_ sender: UIButton) {
        if (txt_loginNumber.text?.count == 0){
            self.showAlert(title:  "Oops!", msg: "Please enter your Email or Phone Number.")
        }else if (txt_password.text?.count == 0){
            self.showAlert(title:  "Oops!", msg: " Please enter password.")
        }else {
            
            guard let url = URL(string: Constants.LoginURL) else { return }
            
            let dict = ["username":txt_loginNumber.text!,
                        "password":txt_password.text!,
                        "imei":"",
                        "device_id":(UIDevice.current.identifierForVendor?.uuidString)!,
                        "lat":"",
                        "long":""
                ] as [String : Any]
            
           NetworkingService.shared.requestData(fromURL:url, params: dict as [String : Any]) { (json) in
                guard let jsonArray = json as? [String: Any] else {return}
                guard let status = jsonArray["status"] as? Int else { return }
                guard let msg = jsonArray["message"] as? String else {return}
            print(status)
                if status == 200 {
                    guard let details = jsonArray["details"] as? [String:Any] else {return}
                    GlobalMethods.saveUserData(details: details)
                }
                if status == 500 {
                   //Another device login
//                    ({
//                        message = "Another device login";
//                        otp = 139926;
//                        status = 500;
//                    })
                    
                    guard let otp = jsonArray["otp"] as? Int else {return}
                    print(otp)
                    let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "VerifyViewController") as? VerifyViewController
                    vc?.fromVC = "Login"
                    vc?.mobile_no = self.txt_loginNumber.text!
                    self.navigationController?.pushViewController(vc!, animated: true)
                    
                }
                if status == 400 {
                    print(msg)
                    
                }
                
            }
            
        }
    }
    
    @IBAction func action_forgotPassBtn(_ sender: UIButton) {
        
    
        
    }
    
}
