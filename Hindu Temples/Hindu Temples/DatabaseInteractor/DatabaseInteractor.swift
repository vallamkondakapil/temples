//
//  DatabaseInteractor.swift
//  Hindu Temples
//
//  Created by kapil vallamkonda on 8/6/18.
//  Copyright © 2018 kapil vallamkonda. All rights reserved.
//

import Foundation
import Firebase

class DatabaseInteractor {
    func getCurrentUser(success: @escaping (UserEntity) -> Void, failure: @escaping () -> Void) {
        guard let user = Auth.auth().currentUser else {
            failure()
            return
        }
        FirebaseManager().getCurrentUser(userId: user.uid) { (user) in
            guard let user = user else {
                failure()
                return
            }
            success(user)
        }
    }
}
