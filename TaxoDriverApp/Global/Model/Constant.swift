//
//  Constant.swift
//  TaxoDriverApp
//
//  Created by Sonam on 07/04/19.
//  Copyright © 2019 Sonam. All rights reserved.
//

import Foundation

struct Constants {
    
    static let isUserLogin = "isUserLogin"
    static let GOOGLE_API_KEY = "AIzaSyDDgSrnu3WTLytkrGRtfLI7iIQ_Oa_vZ40"
    
    static let BaseURL = "http://taxocabs.co.in/apis/"
    static let SignUpURL = BaseURL + "signup.php"
    static let VerifyOtpURL = BaseURL + "otp-verify.php"
    static let LoginURL = BaseURL + "login.php"
}

class GlobalMethods {
    
    static func saveUserData(details:[String:Any]){
        guard let address = details["address"] as? String else {return}
        UserDefaults.standard.set(address, forKey: "Driver_address")
        guard let city = details["city"] as? String else {return}
        UserDefaults.standard.set(city, forKey: "Driver_city")
        guard let email = details["email"] as? String else {return}
        UserDefaults.standard.set(email, forKey: "Driver_email")
        guard let fname = details["fname"] as? String else {return}
        UserDefaults.standard.set(fname, forKey: "Driver_firstName")
        guard let lname = details["lname"] as? String else {return}
        UserDefaults.standard.set(lname, forKey: "Driver_lastName")
        guard let id = details["id"] as? String else {return}
        UserDefaults.standard.set(id, forKey: "Driver_ID")
        guard let licence_no = details["licence_no"] as? String else {return}
        UserDefaults.standard.set(licence_no, forKey: "Driver_licence_no")
        guard let token = details["token"] as? String else {return}
        UserDefaults.standard.set(token, forKey: "auth_token")
        guard let vehical_no = details["vehical_no"] as? String else {return}
        UserDefaults.standard.set(vehical_no, forKey: "Driver_vehical_no")
        guard let vehical_type = details["vehical_type"] as? String else {return}
        UserDefaults.standard.set(vehical_type, forKey: "Driver_vehical_type")
        guard let mobile = details["mobile"] as? String else {return}
        UserDefaults.standard.set(mobile, forKey: "Driver_mobileNumber")
        UserDefaults.standard.set(true, forKey: Constants.isUserLogin)
        SwitcherRootVC .updateRootVC()
        
    }
    
    
    
    
    
    
    
}
