//
//  ThreeButtonView.swift
//  Hindu Temples
//
//  Created by kapil vallamkonda on 8/11/18.
//  Copyright © 2018 kapil vallamkonda. All rights reserved.
//

import Foundation
import UIKit

class ThreeButtonView: UIView {
    @IBOutlet weak var leftButton: UIButton?
    @IBOutlet weak var centerButton: UIButton?
    @IBOutlet weak var rightButton: UIButton?
    
    var leftBtnTitle: String?
    var rightBtnTitle: String?
    var centerBtnTitle: String?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    convenience init(leftBtnTitle: String, centerBtnTitle: String, rightBtnTitle: String) {
        self.init(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.width * 0.15))
        self.leftBtnTitle = leftBtnTitle
        self.rightBtnTitle = rightBtnTitle
        self.centerBtnTitle = centerBtnTitle
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func setup() {
        // Set titles
        leftButton?.setTitle(leftBtnTitle, for: .normal)
        centerButton?.setTitle(centerBtnTitle, for: .normal)
        rightButton?.setTitle(rightBtnTitle, for: .normal)
        
        // Customize
        leftButton?.customize()
        rightButton?.customize()
        centerButton?.customize()
        
        // Set background color
        leftButton?.backgroundColor = UIColor.gray
        rightButton?.backgroundColor = UIColor.gray
        centerButton?.backgroundColor = UIColor.gray
    }
}
