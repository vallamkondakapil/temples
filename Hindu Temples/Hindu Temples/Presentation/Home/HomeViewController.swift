//
//  HomeViewController.swift
//  Hindu Temples
//
//  Created by kapil vallamkonda on 7/16/18.
//  Copyright © 2018 kapil vallamkonda. All rights reserved.
//

import Foundation
import UIKit
import GoogleSignIn

class HomeViewController: BaseViewController {
    @IBOutlet weak var userNameLabel: UILabel!
    var presenter: HomePresenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if GIDSignIn.sharedInstance().hasAuthInKeychain() == false {
            self.dismiss(animated: true, completion: nil)
            return
        }
        presenter = HomePresenter(self)
        presenter?.setupUI()
    }
    
    @IBAction func signOutCLicked(_ sender: Any) {
        GIDSignIn.sharedInstance().signOut()
       UserDefaults.standard.set(false, forKey: LOGIN_STATUS)
        guard let parent = self.parent as? UINavigationController else { return }
        parent.dismiss(animated: true, completion: nil)
        
    }
}
