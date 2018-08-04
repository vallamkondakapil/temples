//
//  LoginVC.swift
//  Hindu Temples
//
//  Created by kapil vallamkonda on 7/18/18.
//  Copyright © 2018 kapil vallamkonda. All rights reserved.
//

import Foundation
import UIKit

class LoginVC: BaseViewController {
    @IBOutlet weak var loginView: UIView?
    @IBOutlet weak var signupView: UIView?
    @IBOutlet weak var loginEmailField: UITextField?
    @IBOutlet weak var loginPasswordField: UITextField?
    
    @IBOutlet weak var nameTextField: UITextField?
    @IBOutlet weak var address1TextField: UITextField?
    @IBOutlet weak var address2TextField: UITextField?
    @IBOutlet weak var phoneNumberTextField: UITextField?
    @IBOutlet weak var stateTextField: UITextField?
    @IBOutlet weak var cityTextField: UITextField?
    @IBOutlet weak var zipTextField: UITextField?
    @IBOutlet weak var emailTextField: UITextField?
    @IBOutlet weak var passwordTextField: UITextField?
    @IBOutlet weak var confirmPasswordTextField: UITextField?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.black.withAlphaComponent(0.3)
        self.signupView?.isHidden = true
    }
    @IBAction func signUpClicked(_ sender: Any) {
        UIView.animate(withDuration: 0.3) {
            self.loginView?.isHidden = true
            self.signupView?.isHidden = false
        }
    }
  
    @IBAction func loginClicked(_ sender: Any) {
        guard let emailID = self.loginEmailField?.text, let password = loginPasswordField?.text, password.count > 5 else {
            Utils.displayAlert(message: "Please enter complete details.", viewController: self)
            return
        }
        FirebaseManager.init().loginTemple(email: emailID, password: password) { (isVerified, templeEntity) in
            if isVerified {
                Utils.displayAlert(message: "Verified.", viewController: self)
            }else {
                Utils.displayAlert(message: "Not verified", viewController: self)
            }
        }
    }
    @IBAction func signUpSubmitted(_ sender: Any) {
        // Signup the temple
        guard let name = nameTextField?.text, let phoneNumber = phoneNumberTextField?.text, let password = passwordTextField?.text, let confirm = confirmPasswordTextField?.text, let emailID = emailTextField?.text else { return }
        if name.isEmpty || phoneNumber.isEmpty || (password != confirm ) {
            // Display inline errors
            return
        }
        let signupEntity = SignupEntity(name: name, emailID: emailID, password: password, phoneNumber: phoneNumber)
        FirebaseManager().signupTemple(entity: signupEntity)
        let alertVC = UIAlertController(title: "Your application has been submitted. You will receive a email once approved.", message: "", preferredStyle: .alert)
        let okayAction = UIAlertAction(title: "Ok", style: .default) { (alert) in
            self.view.removeFromSuperview()
        }
        alertVC.addAction(okayAction)
        self.present(alertVC, animated: true, completion: nil)
    }
    @IBAction func backClicked(_ sender: Any) {
        UIView.animate(withDuration: 0.3, animations: {
            self.view.center.y = -(UIScreen.main.bounds.height)
        }) { (animated) in
            self.view.removeFromSuperview()
            self.removeFromParentViewController()
        }
    }
    
    @IBAction func cancelClicked(_ sender: Any) {
        self.loginView?.isHidden = false
        self.signupView?.isHidden = true
    }
}
