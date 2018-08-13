//
//  AuthInteractor.swift
//  Hindu Temples
//
//  Created by kapil vallamkonda on 8/8/18.
//  Copyright © 2018 kapil vallamkonda. All rights reserved.
//

import Foundation

class AuthInteractor {
    func sigin(email: String, password: String, success: @escaping (UserEntity) -> Void, failure: @escaping (String?) -> ()) {
        FirebaseManager().signin(email: email, password: password, success: { (user) in
            FirebaseManager().getCurrentUser(userId: user.uid, success: { (userEntity) in
                if let userEntity = userEntity {
                    success(userEntity)
                }else{
                    failure("Failed to retrieve user data.")
                }
            })
        }) {
            failure("Sign in failed.")
        }
    }
    
    func signup(signupEntity: SignupEntity, success: @escaping (Bool) -> ()) {
        FirebaseManager().signupUser(signupEntity: signupEntity) { (isSuccess) in
            isSuccess ? success(true) : success(false)
        }
    }
}
