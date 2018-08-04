//
//  UserEntity.swift
//  Hindu Temples
//
//  Created by Kapil Vallamkonda on 7/28/18.
//  Copyright © 2018 kapil vallamkonda. All rights reserved.
//

import Foundation

class UserEntity {
    enum UserENtityKeys: String {
        case id
        case firstName
        case lastName
        case email
    }
    let id: String
    let firstName: String
    let lastName: String
    let email: String
    
    init(uid: String, json: [String: AnyObject]) {
        self.id = uid
        self.firstName = json[UserENtityKeys.firstName.rawValue] as? String ?? ""
        self.lastName = json[UserENtityKeys.lastName.rawValue] as? String ?? ""
        self.email = json[UserENtityKeys.email.rawValue] as? String ?? ""
    }
    
    init(uid: String, firstName: String, lastName: String, email: String) {
        self.id = uid
        self.firstName = firstName
        self.lastName = lastName
        self.email = email
    }
    
    func toJSON() -> [String: AnyObject] {
        return [UserENtityKeys.id.rawValue: self.id as AnyObject, UserENtityKeys.firstName.rawValue: self.firstName as AnyObject, UserENtityKeys.lastName.rawValue: self.lastName as AnyObject, UserENtityKeys.email.rawValue: self.email as AnyObject]
    }
}
