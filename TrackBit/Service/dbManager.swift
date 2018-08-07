//
//  db.swift
//  TrackBit
//
//  Created by Vladislav on 07.08.2018.
//  Copyright © 2018 Vladislav. All rights reserved.
//

import Foundation
import RealmSwift

class dbManager {
    
    let realm = try! Realm()
    
    func insert(data:Data,date:Date,referenceType:String? = nil) {
        delete(byReference:nil)
        let entity = Entity()
        entity.data = data
        entity.date = date
        entity.referenceType = referenceType
         try! realm.write {
            realm.add(entity)
        }
    }
    
    func fetch() -> [Entity]? {
        let objects = realm.objects(Entity.self)
        let array = Array(objects)
        return array
    }
    
    func count() -> Int {
        let objects = realm.objects(Entity.self)
        return objects.count
    }
    
    
    func fetch(byReference ref:String?) -> Entity? {
        var predicate:NSPredicate
        if let ref = ref {
            predicate = NSPredicate(format: "referenceType = %@", ref)
        }else {
            predicate = NSPredicate(format: "referenceType = nil")
        }
        guard let object = realm.objects(Entity.self).filter(predicate).first else {
            return nil
        }
        return object
    }
    
    func delete(byReference ref:String?) {
        guard let storedObject = fetch(byReference: ref) else { return }
        try! realm.write {
            realm.delete(storedObject)
        }
    }
    
    func removeAll() {
        try! realm.write {
            realm.deleteAll()
        }
    }
    
}
