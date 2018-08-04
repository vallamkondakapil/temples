//
//  TempleEntity.swift
//  Hindu Temples
//
//  Created by Kapil Vallamkonda on 7/28/18.
//  Copyright © 2018 kapil vallamkonda. All rights reserved.
//

import Foundation

class TempleEntity {
    enum TempleEntityKeys: String {
        case name
        case email
        case address1
        case address2
        case phone
        case verified
    }
    
    let id: String
    let name: String
    let email: String
    let address1: String
    let address2: String
    let phone: String
    let verified: Bool

    init?(uid: String, json: [String: AnyObject]) {
        guard let name = json[TempleEntityKeys.name.rawValue] as? String,
            let email = json[TempleEntityKeys.email.rawValue] as? String,
            let verified = json[TempleEntityKeys.verified.rawValue] as? Bool else {
                return nil
        }
        
        let address1 = json[TempleEntityKeys.address1.rawValue] as? String ?? ""
        let address2 = json[TempleEntityKeys.address2.rawValue] as? String ?? ""
        let phone = json[TempleEntityKeys.phone.rawValue] as? String ?? ""
        self.name = name
        self.verified = verified
        self.email = email
        self.address2 = address2
        self.address1 = address1
        self.phone = phone
        self.id = uid
    }
}
