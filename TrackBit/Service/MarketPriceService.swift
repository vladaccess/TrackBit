//
//  MarketPriceService.swift
//  TrackBit
//
//  Created by Vladislav on 08.07.2018.
//  Copyright © 2018 Vladislav. All rights reserved.
//

import Foundation

protocol MarketPriceDelegate:class {
    func marketPriceDidComplite(_ marketPrice:MarketPrice)
    func marketPriceDidfailed(_ serviceFail:ServiceFailure)
}


class MarketPriceService:Service<MarketPrice> {
    
    var marketPriceAPI = MarketPriceApiService()
    
    
    weak var delegate:MarketPriceDelegate?
    
    
    func get(referenceType:ReferenceType) {
        if let object = self.fetch(byReference: referenceType) {
            DispatchQueue.main.async {
                self.delegate?.marketPriceDidComplite(object)
            }
            return
        }
        marketPriceAPI.get(referenceType: referenceType, success: { (data) in
            self.success(referenceType,data:data)
        }) { (failure) in
            self.failure(referenceType, failure)
        }
    }
    
    
    func success(_ refType:ReferenceType,data:Data) {
        DispatchQueue.main.async {
            if let marketPrice = self.jsonDecode(data) {
                self.delegate?.marketPriceDidComplite(marketPrice)
                self.insert(data:data, date: Date(), referenceType: refType.rawValue)
            }else {
                self.delegate?.marketPriceDidfailed(.server)
            }
        }
    }
    
    
    
    
    func failure(_ refType:ReferenceType,_ fail:ServiceFailure) {
        DispatchQueue.main.async {
            if let marketPrice = self.fetch(byReference: refType) {
                self.delegate?.marketPriceDidComplite(marketPrice)
            }else {
                self.delegate?.marketPriceDidfailed(fail)
            }
        }
        
    }
    
    
}
