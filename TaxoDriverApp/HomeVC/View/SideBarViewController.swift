//
//  SideBarViewController.swift
//  SideMenuBar
//
//  Created by Rakesh Kumar on 20/03/19.
//  Copyright © 2019 Rakesh Kumar. All rights reserved.
//

import UIKit

class SideBarViewController: UIViewController{
 
    var menuArray:[String]?
    override func viewDidLoad() {
        super.viewDidLoad()
        menuArray = ["Home","Payment","History","Notifications","Settings","Help"]
      
  }
   
}
extension SideBarViewController:UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0{
            return 1
        }else{
            return (menuArray?.count)!
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        if indexPath.section == 0{
        
        let cell:HeaderTableViewCell = tableView.dequeueReusableCell(withIdentifier: "HeaderTableViewCell") as! HeaderTableViewCell
        return cell
        
        }else{
       
        let cell :FirstTableViewCell = tableView.dequeueReusableCell(withIdentifier: "FirstTableViewCell") as! FirstTableViewCell
            cell.lbl_items.text = menuArray![indexPath.row]
        return cell
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section==0{
        return 60
          }else {
          return 50
        }
    
}
}
