//
//  TwoButtonView.swift
//  Hindu Temples
//
//  Created by kapil vallamkonda on 8/11/18.
//  Copyright © 2018 kapil vallamkonda. All rights reserved.
//

import Foundation
import Foundation
import UIKit

class TwoButtonView: UIView {

    @IBOutlet weak var leftButton: CustomButton!
    @IBOutlet weak var rightButton: CustomButton!
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
    }
}
