//
//  FirebaseManager.swift
//  Hindu Temples
//
//  Created by Kapil Vallamkonda on 7/24/18.
//  Copyright © 2018 kapil vallamkonda. All rights reserved.
//

import Foundation
import FirebaseCore
import FirebaseDatabase
import Firebase

class FirebaseManager {
    private var ref: DatabaseReference
    
    init() {
        ref = Database.database().reference()
    }
    
    func signin(email: String, password: String, success: @escaping (User) -> Void, failure: @escaping () -> ()) {
        Auth.auth().signIn(withEmail: email, password: password) { (user, error) in
            if let user = user {
                success(user)
            }else{
                failure()
            }
        }
    }
    
    static func login(email: String, password: String, success: @escaping (User) -> Void, failure: @escaping (Error) -> Void) {
        Auth.auth().signIn(withEmail: email, password: password) { (user, error) in
            guard let user = user else {
                failure(error!)
                return
            }
            success(user)
        }
    }
    
    func loginTemple(email: String, password: String, success: @escaping (Bool, TempleEntity?) -> Void) {
        Auth.auth().signIn(withEmail: email, password: password) { (user, error) in
            if error == nil {
                guard let user = user else {
                    return
                }
                self.ref.child("/temples").child(user.uid).observeSingleEvent(of: .value, with: { (snapshot) in
                    guard let templeDetails = snapshot.value as? [String: AnyObject], let entity = TempleEntity(uid: user.uid, json: templeDetails) else {
                        success(false, nil)
                        return
                    }
                    let isVerified = entity.verified
                    if isVerified {
                        guard let entity = TempleEntity(uid: user.uid, json: templeDetails) else {
                            success(false, nil)
                            return
                        }
                       success(true, entity)
                    } else {
                        success(false, nil)
                    }
                })
            }
        }
    }
    
    func signupTemple(entity: SignupEntity) {
        // Create temple admin
        Auth.auth().createUser(withEmail: entity.emailID, password: entity.password) { (user, error) in
            if error == nil {
                let templeId = user?.uid
                var templeDetails = entity.toJSON()
                templeDetails["verified"] = false as AnyObject
                self.ref.child("/temples/\(templeId ?? "")").setValue(templeDetails)
            }
        }
    }
    
    func signupUser(signupEntity: SignupEntity, success: @escaping (Bool) -> Void){
        Auth.auth().createUser(withEmail: signupEntity.emailID, password: signupEntity.password) { (user, error) in
            if error == nil {
                let userId = user?.uid
                let userDetails = signupEntity.toJSON()
                self.ref.child("/users/\(userId ?? "")").setValue(userDetails, withCompletionBlock: { (err, ref) in
                    success(err == nil ? true : false)
                })
            }
        }
    }
    
    func getCurrentUser(userId: String, success: @escaping (UserEntity?) -> Void) {
        self.ref.child("/users/\(userId)").observeSingleEvent(of: .value) { (snapshot) in
            if snapshot.exists() {
                guard let value = snapshot.value as? [String: AnyObject] else {
                    success(nil)
                    return
                }
                success(UserEntity(uid: userId, json: value))
            }else{
                success(nil)
            }
        }
    }
    
    func createUser(userId: String, user: UserEntity) {
        self.ref.child("/users/\(userId)").setValue(user.toJSON())
    }
}
