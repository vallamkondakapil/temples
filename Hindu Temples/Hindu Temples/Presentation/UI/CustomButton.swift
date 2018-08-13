//
//  CustomButton.swift
//  Hindu Temples
//
//  Created by kapil vallamkonda on 8/8/18.
//  Copyright © 2018 kapil vallamkonda. All rights reserved.
//

import Foundation
import UIKit

class CustomButton: UIButton {
    override func layoutSubviews() {
        super.layoutSubviews()
        setup()
    }
    
    func setup() {
        self.customize()
        let screenWidth = UIScreen.main.bounds.width
        self.bounds = CGRect(x: 0, y: 0, width: screenWidth * 0.3, height: screenWidth * 0.1)
    }
}

extension UIButton {
    func customize() {
        self.backgroundColor = UIColor.secondaryColor()
        self.layer.borderColor = UIColor.white.cgColor
        self.layer.borderWidth = 1.0
        self.layer.cornerRadius = 10.0
        self.titleLabel?.textColor = UIColor.white
    }
}


