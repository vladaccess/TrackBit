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
    
    func fetch(byReference ref:ReferenceType,cached days:Int? = nil) -> T? {
        guard let object = db.fetch(byReference: ref.rawValue) else { return nil }
        if let days = days,let data = object.data {
            return jsonDecode(data)
        }
        guard let date = object.date,let days = days,let data = object.data else { return nil }
        if Date().deprive(date: date) <= days {
            return jsonDecode(data)
        }
        
        return nil
    }
    
    
    
    
}

enum ServiceFailure {
    case connection,server
}
