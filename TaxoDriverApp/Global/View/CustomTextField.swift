//
//  CustomTextField.swift
//  TaxoDriverApp
//
//  Created by Sonam on 04/04/19.
//  Copyright © 2019 Sonam. All rights reserved.
//

import UIKit

class CustomTextField: UITextField {
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        self.commonInit()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.commonInit()
    }
    
    func commonInit() {
        self.borderStyle = .none //To remove default border.
        let bottomBorder = UIView()
        bottomBorder.frame.size = CGSize(width: self.frame.size.width, height: 1)
        bottomBorder.frame.origin = CGPoint(x: 0, y: self.frame.size.height - 1)
        bottomBorder.backgroundColor = UIColor(red: 221/255, green: 221/255, blue:221/255, alpha: 1.0)
        bottomBorder.autoresizingMask = [.flexibleWidth, .flexibleTopMargin]
        self.addSubview(bottomBorder)
        
    }
}
