//
//  UserDefaults+Extensions.swift
//  TrackBit
//
//  Created by Vladislav on 06.08.2018.
//  Copyright © 2018 Vladislav. All rights reserved.
//

import Foundation



extension UserDefaults {
    struct Key {
        static let stringKey = "Reference"
    }
    
    func getReference() -> ReferenceType {
        let stringValue = UserDefaults.standard.value(forKey: Key.stringKey) as? String ?? ""
        let value = ReferenceType(rawValue: stringValue)
        return value ?? ReferenceType.week
    }
    
    func setReference(ref:ReferenceType) {
        set(ref.rawValue, forKey: Key.stringKey)
    }
}
