//
//  SignupEntity.swift
//  Hindu Temples
//
//  Created by Kapil Vallamkonda on 7/24/18.
//  Copyright © 2018 kapil vallamkonda. All rights reserved.
//

import Foundation

struct SignupEntity {
    let name: String
    let emailID: String
    let password: String
    let phoneNumber: String
    
    func toJSON() -> [String: AnyObject] {
        return ["name": self.name as AnyObject, "email": self.emailID as AnyObject]
    }
}
