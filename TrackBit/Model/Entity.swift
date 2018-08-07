//
//  Entity.swift
//  TrackBit
//
//  Created by Vladislav on 07.08.2018.
//  Copyright © 2018 Vladislav. All rights reserved.
//

import Foundation
import RealmSwift

class Entity:Object {
    @objc dynamic var data:Data?
    @objc dynamic var date:Date?
    @objc dynamic var referenceType:String?
}
