//
//  TickerService.swift
//  TrackBit
//
//  Created by Vladislav on 07.07.2018.
//  Copyright © 2018 Vladislav. All rights reserved.
//

import UIKit


protocol TickerServiceProtocol:class {
    func tickerServiceDidComplited(ticker:Ticker,date:Date,cache:Bool)
    func tickerServiceDidFailed(_ serviceFail:ServiceFailure)
}

class TickerService:Service<Ticker> {
    
    var tickerAPIService = TickerApiService()
    
    weak var delegate:TickerServiceProtocol?
    
    func get() {
        tickerAPIService.get(success: { (data) in
            self.success(data)
        }, failure: { (fail) in
            self.failed(fail)
        })
    }
    
    func success(_ data:Data) {
        DispatchQueue.main.async {
            if let ticker = self.jsonDecode(data) {
                let date = Date()
                self.insert(data: data, date: date)
                self.delegate?.tickerServiceDidComplited(ticker: ticker, date: date, cache: false)
            }else {
                self.delegate?.tickerServiceDidFailed(.server)
            }
        }
    }
    
    func failed(_ failed:ServiceFailure) {
        DispatchQueue.main.async {
            guard let storedObject = self.db.fetch(byReference: nil) else {
                self.delegate?.tickerServiceDidFailed(failed)
                return
            }
            if let data = storedObject.data,let date = storedObject.date {
                if let ticker = self.jsonDecode(data){
                    self.delegate?.tickerServiceDidComplited(ticker: ticker, date: date, cache: true)
                }
            }
            self.delegate?.tickerServiceDidFailed(failed)
        }
    }
    
}
