//
//  SignupTextfield.swift
//  Hindu Temples
//
//  Created by kapil vallamkonda on 8/8/18.
//  Copyright © 2018 kapil vallamkonda. All rights reserved.
//

import Foundation
import UIKit

class SignupTextfield: UIView {
    
    @IBOutlet weak var signupTextField: UITextField?

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setup()
    }
    
    
    func setup() {
        self.backgroundColor = UIColor.primaryColor()
        self.signupTextField?.textColor = UIColor.white
        self.signupTextField?.borderStyle = .roundedRect
        self.signupTextField?.layer.borderColor = UIColor.white.cgColor
        self.signupTextField?.layer.borderWidth = 1.0        
        self.signupTextField?.backgroundColor = UIColor.primaryColorDark()
        self.signupTextField?.layer.cornerRadius = 5.0
    }
   
}
