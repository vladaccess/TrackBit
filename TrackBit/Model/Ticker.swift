//
//  Ticker.swift
//  TrackBit
//
//  Created by Vladislav on 07.07.2018.
//  Copyright © 2018 Vladislav. All rights reserved.
//

import Foundation


struct Ticker:Decodable {
    var USD:TickerItem
    
    struct TickerItem:Decodable {
        var last:Float
    }
    
}
