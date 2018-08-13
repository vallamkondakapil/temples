//
//  SignupPresenter.swift
//  Hindu Temples
//
//  Created by kapil vallamkonda on 8/9/18.
//  Copyright © 2018 kapil vallamkonda. All rights reserved.
//

import Foundation
import UIKit

class SignupPresenter {
    var viewController: SignupVC
    init(vc: SignupVC) {
        self.viewController = vc
    }
    
    func setupUI() {
        createTextField(placeholder: "First name")
        createTextField(placeholder: "Last name")
        createTextField(placeholder: "Email address")
        createTextField(placeholder: "Phone number")
        createTextField(placeholder: "Address")
        createTwoButton()
        createThreeButton()
    }
    
    private func createThreeButton() {
        let threeBtnView = ThreeButtonView(leftBtnTitle: "User", centerBtnTitle: "Priest", rightBtnTitle: "Admin")
        self.viewController.stackView?.addArrangedSubview(threeBtnView)
    }
    
    private func createTextField(placeholder: String) {
        guard let view = Utils.getViewFromNib(name: "SignupTextfield") as? SignupTextfield else {
            return 
        }
        view.signupTextField?.attributedPlaceholder = NSAttributedString(string: placeholder, attributes: [NSAttributedStringKey.foregroundColor : UIColor.white])
        view.signupTextField?.textColor = UIColor.white
        viewController.stackView?.addArrangedSubview(view)
    }
    
    private func createTwoButton() {
        guard let view = Utils.getViewFromNib(name: "TwoButtonView") as? TwoButtonView else {
            return
        }
        view.leftButton.setTitle("Cancel", for: .normal)
        view.rightButton.setTitle("Submit", for: .normal)
        viewController.stackView?.addArrangedSubview(view)
    }
}
