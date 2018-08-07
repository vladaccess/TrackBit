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
        marketPriceAPI.get(referenceType: referenceType, success: { (data) in
            if let object = self.fetch(byReference: referenceType) {
                DispatchQueue.main.async {
                    self.delegate?.marketPriceDidComplite(object)
                }
                return
            }
            self.success(referenceType,data:data)
        }) { (failure) in
            self.failure(referenceType, failure)
        }
    }
    
    
    //Will
    func success(_ refType:ReferenceType,data:Data) {
        DispatchQueue.main.async {
            if let marketPrice = self.jsonDecode(data) {
                self.delegate?.marketPriceDidComplite(marketPrice)
                //Insert in db
            }else {
                self.delegate?.marketPriceDidfailed(.server)
                //FIX ????????????
            }
        }
    }
    
    
    
    //Will
    func failure(_ refType:ReferenceType,_ fail:ServiceFailure) {
        //Fail
    }
    
    
}
