//
//  ViewController.swift
//  Hindu Temples
//
//  Created by kapil vallamkonda on 7/16/18.
//  Copyright © 2018 kapil vallamkonda. All rights reserved.
//

import UIKit
import Firebase
import GoogleSignIn

class LoginController: UIViewController, GIDSignInUIDelegate {
    @IBOutlet weak var emailTextField: CustomTextField?
    @IBOutlet weak var passwordTextField: CustomTextField?
    
    var presenter: LoginPresenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = LoginPresenter(vc: self)
        setupUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        presentHomePage()
    }
    
    @IBAction func forgotPasswordClicked(_ sender: UIButton) {
        
    }
    @IBAction func signupClicked(_ sender: Any) {
        presenter?.signupClicked()
    }
    @IBAction func loginClicked(_ sender: UIButton) {
        presenter?.loginClicked()
    }
    
    func setupUI() {
        self.view.backgroundColor = UIColor.primaryColor()
    }
    
    func presentHomePage() {
        if UserDefaults.standard.bool(forKey: LOGIN_STATUS) == true {
            let homeVC = UIStoryboard(name: "Main", bundle: nil)
            let controller = homeVC.instantiateViewController(withIdentifier: "homeVC")
            let navController = UINavigationController(rootViewController: controller)
            self.present(navController, animated: true, completion: nil)
        }
    }
}

extension LoginController: GIDSignInDelegate{
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        // ...
        if (error) != nil {
            // ...
            return
        }
        
        guard let authentication = user.authentication else { return }
        let credential = GoogleAuthProvider.credential(withIDToken: authentication.idToken,
                                                       accessToken: authentication.accessToken)
        Auth.auth().signIn(with: credential) { (authuser, error) in
            if let authuser = authuser {
                // Check if its new user.
                FirebaseManager().getCurrentUser(userId: authuser.uid, success: { (user) in
                    if let user = user {
                        // Existing user.
                        UserDefaults.standard.set(true, forKey: LOGIN_STATUS)
                        self.presentHomePage()
                    }else{
                        // Create new user.
                        let userEntity = UserEntity(uid: authuser.uid, firstName: authuser.displayName ?? "", lastName: "", email: authuser.email ?? "")
                        FirebaseManager().createUser(userId: authuser.uid, user: userEntity)
                    }
                })
            }else {
                UserDefaults.standard.set(false, forKey: LOGIN_STATUS)
                return
            }
        }
}
}
