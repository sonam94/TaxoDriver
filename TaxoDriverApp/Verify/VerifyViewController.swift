//
//  VerifyViewController.swift
//  TaxoDriverApp
//
//  Created by Sonam on 08/04/19.
//  Copyright © 2019 Sonam. All rights reserved.
//

import UIKit

class VerifyViewController: UIViewController {
    
    @IBOutlet weak var txt_OTP: CustomTextField!
    var fromVC:String = ""
    var mobile_no:String = ""
    var driverDataDict = [String:Any]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func action_SubmitBtn(_ sender: UIButton) {
        guard let url = URL(string: Constants.VerifyOtpURL) else { return }
        if (txt_OTP.text?.count == 0){
            
            self.showAlert(title:  "Alert!", msg: "Please enter the OTP.")
            
        }else {
            
            if (fromVC == "Register"){
                
                let dict = ["method":"new_register",
                            "otp":txt_OTP.text!,
                            "mobile":mobile_no,
                            "device_id":(UIDevice.current.identifierForVendor?.uuidString)!] as [String : Any]
                
                
                NetworkingService.shared.requestData(fromURL: url, params: dict) { (json) in
                    
                    
                    guard let jsonArray = json as? [String: Any] else {
                        return
                    }
                    guard let status = jsonArray["status"] as? Int else { return }
                    guard let msg = jsonArray["message"] as? String else {return}
                    
                    if (status == 200){
                        
                        guard let details = jsonArray["details"] as? [String:Any] else {return}
                        guard let id = details["id"] as? String else {return}
                        guard let token = details["token"] as? String else {return}
                        self.saveDriverData(atoken: token ,aid:id)
                        
                    }else if (status == 400){
                        print("Invalid request")
                        self.showAlert(title: "Alert", msg: msg)
                    }else{
                        self.showAlert(title: "Alert", msg: msg)
                        print("Somehting wrong")
                    }
                    
                }
            }else {
                //Another device login otp
                let dict = ["method":"",
                            "otp":txt_OTP.text!,
                            "mobile":mobile_no,
                            "device_id":(UIDevice.current.identifierForVendor?.uuidString)!] as [String : Any]
                
                
                NetworkingService.shared.requestData(fromURL: url, params: dict) { (json) in
                    guard let jsonArray = json as? [String: Any] else {
                        return
                    }
                    guard let status = jsonArray["status"] as? Int else { return }
                    guard let msg = jsonArray["message"] as? String else {return}
                    if (status == 200){
                        //{"status":200,"message":"success","details":{"id":"31","fname":"def","lname":"def","mobile":"1112223334","email":"def@gmail.com","otp":"262899","token":"05af56347ab377ae3bbb9e601d6e7675","city":"indore","vehical_no":"mp09ab2019","licence_no":"ASWD123As","vehical_type":"Alto","latitude":"22.890234820","longtitude":"78.03972893","address":"indore india"}}
                        
                        guard let details = jsonArray["details"] as? [String:Any] else {return}
                        GlobalMethods.saveUserData(details: details)
                        
                        
                    }
                }
            }
        }
        
    }
    
    func saveDriverData(atoken:String, aid:String){
        UserDefaults.standard.set(self.driverDataDict["firstname"] as? String, forKey: "Driver_firstName")
        UserDefaults.standard.set(self.driverDataDict["lastname"] as? String, forKey: "Driver_lastName")
        UserDefaults.standard.set(self.driverDataDict["mobile"] as? String, forKey: "Driver_mobileNumber")
        UserDefaults.standard.set(self.driverDataDict["email"] as? String, forKey: "Driver_email")
        UserDefaults.standard.set(self.driverDataDict["device_id"] as? String, forKey: "Driver_device_id")
        UserDefaults.standard.set(self.driverDataDict["city"] as? String, forKey: "Driver_city")
        UserDefaults.standard.set(self.driverDataDict["vehical_no"] as? String, forKey: "Driver_vehical_no")
        UserDefaults.standard.set(self.driverDataDict["licence_no"] as? String, forKey: "Driver_licence_no")
        UserDefaults.standard.set(self.driverDataDict["address"] as? String, forKey: "Driver_address")
        UserDefaults.standard.set(self.driverDataDict["vehical_type"] as? String, forKey: "Driver_vehical_type")
        UserDefaults.standard.set(aid, forKey: "Driver_ID")
        UserDefaults.standard.set(atoken, forKey: "auth_token")
        UserDefaults.standard.set(true, forKey: Constants.isUserLogin)
        SwitcherRootVC .updateRootVC()
    }
}
