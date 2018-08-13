//
//  LoginPresenter.swift
//  Hindu Temples
//
//  Created by kapil vallamkonda on 8/8/18.
//  Copyright © 2018 kapil vallamkonda. All rights reserved.
//

import Foundation
import UIKit

class LoginPresenter {
    let viewController: LoginController
    init(vc: LoginController) {
        self.viewController = vc
    }
    
    func loginClicked() {
        guard let email = viewController.emailTextField?.text, let password = viewController.passwordTextField?.text else {
            Utils.displayAlert(message: "Please enter all fields.", viewController: viewController)
            return
        }
        FirebaseManager().signin(email: email, password: password, success: { (user) in
            
        }) {
            Utils.displayAlert(message: "Signin failed. Please try again later.", viewController: self.viewController)
        }
    }
    
    func signupClicked() {
        guard let signupVC = Utils.getViewController(storyboard: "SignupVC") as? SignupVC else {
            return
        }
        let navVC = UINavigationController(rootViewController: signupVC)
        viewController.present(navVC, animated: true, completion: nil)
    }
    
    func forgotPasswordClicked() {
        
    }
}
