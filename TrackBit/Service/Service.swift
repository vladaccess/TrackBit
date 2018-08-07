//
//  Service.swift
//  TrackBit
//
//  Created by Vladislav on 07.07.2018.
//  Copyright © 2018 Vladislav. All rights reserved.
//

import Foundation

class Service<T:Decodable> {
    
    let db = dbManager()
    
    func jsonDecode(_ data:Data) -> T? {
        do {
            return try JSONDecoder().decode(T.self, from: data)
        }catch {
            return nil
        }
    }
    
    func insert(data:Data,date:Date,referenceType:String? = nil) {
        db.insert(data: data, date: date)
    }
    
    func fetch(byReference ref:String?) -> Entity? {
        return db.fetch(byReference:ref)
    }
    
    
    
    
}

enum ServiceFailure {
    case connection,server
}
