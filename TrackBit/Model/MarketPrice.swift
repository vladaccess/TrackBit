//
//  MarketPrice.swift
//  TrackBit
//
//  Created by Vladislav on 08.07.2018.
//  Copyright © 2018 Vladislav. All rights reserved.
//

import Foundation

struct MarketPrice:Decodable {
    
    let values:[Value]
    
}

struct Value:Decodable {
    let axisX:Int
    let axisY:Float
    
    enum CodingKeys:String,CodingKey {
        case axisX = "x"
        case axisY = "y"
    }
}




