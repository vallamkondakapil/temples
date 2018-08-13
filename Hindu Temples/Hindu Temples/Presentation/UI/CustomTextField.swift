//
//  CustomTextField.swift
//  Hindu Temples
//
//  Created by kapil vallamkonda on 8/8/18.
//  Copyright © 2018 kapil vallamkonda. All rights reserved.
//

import Foundation
import UIKit

class CustomTextField: UITextField {
    @IBInspectable var placeholderTextColor: UIColor {
        get {
            return self.placeholderTextColor
        }
        set {
            self.attributedPlaceholder = NSMutableAttributedString(string: self.placeholder!, attributes: [NSAttributedStringKey.foregroundColor: newValue])
        }
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        setup()
    }
    
    func setup() {
        self.backgroundColor = UIColor.primaryColorDark()
        self.borderStyle = .roundedRect
        self.layer.borderWidth = 1.0
        self.layer.borderColor = UIColor.white.cgColor
        self.layer.cornerRadius = 5.0
        self.textColor = UIColor.white
        let screenWidth = UIScreen.main.bounds.width
        self.bounds = CGRect(x: 0, y: 0, width: screenWidth * 0.9, height: screenWidth * 0.1)
        self.tintColor = UIColor.white
    }
}
