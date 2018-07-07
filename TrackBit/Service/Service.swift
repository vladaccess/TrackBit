//
//  Service.swift
//  TrackBit
//
//  Created by Vladislav on 07.07.2018.
//  Copyright © 2018 Vladislav. All rights reserved.
//

import Foundation

class Service<T:Decodable> {
    
    func jsonDecode(_ data:Data) -> T? {
        do {
            return try JSONDecoder().decode(T.self, from: data)
        }catch {
            return nil
        }
    }
    
    
    
}

enum ServiceFailure {
    case connection,server
}
