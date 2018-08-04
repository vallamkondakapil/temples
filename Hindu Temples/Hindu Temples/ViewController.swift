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

class ViewController: UIViewController, GIDSignInUIDelegate {
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.primaryColor()
        self.loginButton.backgroundColor = UIColor.secondaryColor()
        GIDSignIn.sharedInstance().delegate = self
        GIDSignIn.sharedInstance().uiDelegate = self
        GIDSignIn.sharedInstance().signInSilently()
        self.loginButton.layer.cornerRadius = 15
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        presentHomePage()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func presentHomePage() {
        if UserDefaults.standard.bool(forKey: LOGIN_STATUS) == true {
            let homeVC = UIStoryboard(name: "Main", bundle: nil)
            let controller = homeVC.instantiateViewController(withIdentifier: "homeVC")
            let navController = UINavigationController(rootViewController: controller)
            self.present(navController, animated: true, completion: nil)
            //self.present(controller, animated: true, completion: nil)
        }
    }

    @IBAction func loginClicked(_ sender: Any) {
        if let loginVC = UIStoryboard(name: "LoginVC", bundle: nil).instantiateInitialViewController() as? LoginVC {
            self.addChildViewController(loginVC)
            loginVC.view.frame = self.view.frame
            loginVC.view.center.y = self.view.bounds.height * -0.5
            self.view.addSubview(loginVC.view)
            loginVC.didMove(toParentViewController: self)
            
            UIView.animate(withDuration: 0.3, animations: {
                loginVC.view.center.y = self.view.center.y
            })
        }
    }
}

extension ViewController: GIDSignInDelegate{
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
