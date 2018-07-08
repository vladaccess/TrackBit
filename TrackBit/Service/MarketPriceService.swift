//
//  MarketPriceService.swift
//  TrackBit
//
//  Created by Vladislav on 08.07.2018.
//  Copyright © 2018 Vladislav. All rights reserved.
//

import Foundation

protocol MarketPriceDelegate:class {
    func marketPriceDidComplite(_ marketPrice:MarketPrice,date:Date)
    func marketPriceDidfailed(_ serviceFail:ServiceFailure)
}


class MarketPriceService {
    
    var marketPriceAPI = MarketPriceApiService()
    
    
    weak var delegate:MarketPriceDelegate?
    
    
    func get() {
        //Proccessing of results
    }
    
    
}
