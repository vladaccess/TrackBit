//
//  TickerService.swift
//  TrackBit
//
//  Created by Vladislav on 07.07.2018.
//  Copyright © 2018 Vladislav. All rights reserved.
//

import UIKit


protocol TickerServiceProtocol:class {
    func tickerServiceDidComplited(ticker:Ticker,date:Date,chache:Bool)
    func tickerServiceDidFailed()
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
                //Insert in db
                self.delegate?.tickerServiceDidComplited(ticker: ticker, date: date, chache: false)
            }else {
                self.delegate?.tickerServiceDidFailed()
            }
        }
    }
    
    func failed(_ failed:ServiceFailure) {
        
    }
    
}
