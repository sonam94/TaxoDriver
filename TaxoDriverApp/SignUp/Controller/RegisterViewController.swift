//
//  RegisterViewController.swift
//  TaxoDriverApp
//
//  Created by Sonam on 04/04/19.
//  Copyright © 2019 Sonam. All rights reserved.
//

import UIKit
import IQKeyboardManagerSwift
class RegisterViewController: UIViewController,UITextFieldDelegate & UITextViewDelegate {

    @IBOutlet weak var txt_firstName: UITextField!
    @IBOutlet weak var txt_LastName: UITextField!
    @IBOutlet weak var txt_Email: UITextField!
    @IBOutlet weak var txt_MobileNumber: UITextField!
    @IBOutlet weak var txt_address: UITextField!
    @IBOutlet weak var txt_city: UITextField!
    @IBOutlet weak var txt_password: UITextField!
    @IBOutlet weak var txt_cnfrmPassword: UITextField!
    @IBOutlet weak var txt_vehicleType: UITextField!
    @IBOutlet weak var txt_vehicleNumber: UITextField!
    @IBOutlet weak var txt_LicenseNumber: UITextField!
    var returnKeyHandler: IQKeyboardReturnKeyHandler?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        returnKeyHandler = IQKeyboardReturnKeyHandler(controller: self)
        returnKeyHandler?.delegate = self
      }
   
   @IBAction func action_registerBtn(_ sender: Any) {
//        if (txt_firstName.text?.count == 0){
//            self.showAlert(title:  "Oops!", msg: "Please enter your first name.")
//        }else if (txt_LastName.text?.count == 0){
//            self.showAlert(title:  "Oops!", msg: " Please enter your last name.")
//        }else if (txt_Email.text?.count == 0){
//            self.showAlert(title:  "Oops!", msg: "Please enter your email id.")
//         }else if (txt_vehicleType.text?.count == 0){
//            self.showAlert(title:  "Oops!", msg: "Please enter your vehicle type.")
//        }else if (txt_vehicleNumber.text?.count == 0){
//            self.showAlert(title:  "Oops!", msg: "Please enter your vehicle number.")
//        }else if !isValidVehicleNumber(testStr: txt_vehicleNumber.text!){
//            self.showAlert(title:  "Oops!", msg: "Please enter valid vehicle number.")
//        } else if (txt_city.text?.count == 0){
//            self.showAlert(title:  "Oops!", msg: "Please enter your city.")
//        }else if (txt_address.text?.count == 0){
//            self.showAlert(title:  "Oops!", msg: "Please enter your address.")
//        }else if !isValidEmail(testStr: txt_Email.text!){
//            self.showAlert(title:  "Oops!", msg: "Please enter valid email id.")
//        }else if (txt_MobileNumber.text?.count == 0 || txt_MobileNumber.text!.count != 10){
//           self.showAlert(title:  "Oops!", msg: "Please enter valid mobile number.")
//         }else if (txt_password.text?.count == 0){
//           self.showAlert(title:  "Oops!", msg: "Please enter password.")
//        }else if (txt_cnfrmPassword.text != txt_password.text){
//            self.showAlert(title:  "Oops!", msg: "Confirmed password not matched please try again.")
//        }else if (txt_LicenseNumber.text?.count == 0){
//            self.showAlert(title:  "Oops!", msg: "Please enter your license number.")
//        }
//        else{
            print ("succesful")
           self.jsonParsing()
  }
    


    
    func jsonParsing(){
        guard let url = URL(string: Constants.SignUpURL) else { return }
        
        let dict = [
            "firstname":txt_firstName.text!,
            "lastname":txt_LastName.text!,
            "mobile":txt_MobileNumber.text!,
            "email":txt_Email.text!,
            "password":txt_password.text!,
            "imei":"",
            "device_id":(UIDevice.current.identifierForVendor?.uuidString)!,
            "lat":"",
            "long":"",
            "city":txt_city.text!,
            "vehical_no":"mp09ab2019",
            "licence_no":"ASWD123As",
            "address":"indore india",
            "vehical_type":"Alto"
        ]
        
        print(dict)
        
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "VerifyViewController") as? VerifyViewController
        vc?.fromVC = "Register"
        vc?.driverDataDict = dict
        self.navigationController?.pushViewController(vc!, animated: true)

        NetworkingService.shared.requestData(fromURL:url, params: dict as [String : Any]) { (json) in
            guard let jsonArray = json as? [String: Any] else {
                return
            }
            guard let status = jsonArray["status"] as? Int else { return }
            guard let msg = jsonArray["message"] as? String else {return}

            print(status)
            if (status == 201){
            //{"status":201,"message":"User already register"}
                print("user already registered")
                self.showAlert(title: "Alert" , msg: msg)
              }
            if (status == 400){
                print("Invalid request")
                self.showAlert(title: "Alert" , msg: msg)
             }
            if (status == 200){
                print("succesful")
              //{"status":200,"message":"Registration successfully done","otp":922113}
                guard let otp = jsonArray["otp"] as? Int else {return}

                print(otp)
                let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "VerifyViewController") as? VerifyViewController
                vc?.mobile_no = self.txt_MobileNumber.text!
                vc?.fromVC = "Register"
                vc?.driverDataDict = dict
                self.navigationController?.pushViewController(vc!, animated: true)
            }


        }
        
    }
    
    func isValidEmail(testStr:String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        let result = emailTest.evaluate(with: testStr)
        return result
    }
    func isValidVehicleNumber(testStr:String) -> Bool {
        let emailRegEx = "^[A-Za-z]{2}[0-9]{2}[A-Za-z]{2}[0-9]{4}$"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        let result = emailTest.evaluate(with: testStr)
        return result
    }
    func isValidLicenseNumber(testStr:String) -> Bool {
        let emailRegEx = "^(?<intro>[A-Z]{2})(?<numeric>\\d{2})(?<intros>[A-Z])(?<year>\\d{4})(?<tail>\\d{7})$"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        let result = emailTest.evaluate(with: testStr)
        return result
    }
  


}

extension UIViewController {
    func showAlert(title:String , msg:String) {
        let alert = UIAlertController(title: title, message: msg, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: { _ in
        }))
        self.present(alert, animated: true, completion: nil)
    }
}


