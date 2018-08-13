//
//  HomePresenter.swift
//  Hindu Temples
//
//  Created by kapil vallamkonda on 8/6/18.
//  Copyright © 2018 kapil vallamkonda. All rights reserved.
//

import Foundation

class HomePresenter {
    weak var viewController: BaseViewController?
    
    init(_ viewController: BaseViewController) {
        self.viewController = viewController
    }
    
    func setupUI() {
        guard let vc = self.viewController as? HomeViewController else { return }
        DatabaseInteractor().getCurrentUser(success: { (user) in
            // Set username
            vc.userNameLabel.text = "Welcome \(user.firstName) \(user.lastName)"
        }) {
            // Handle failure
            print("Retrieving current user failed.")
        }
        
    }
}
