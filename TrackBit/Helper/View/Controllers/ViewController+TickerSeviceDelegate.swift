//
//  ViewController+Delegate.swift
//  TrackBit
//
//  Created by Vladislav on 09.07.2018.
//  Copyright © 2018 Vladislav. All rights reserved.
//

import Foundation

extension ViewController:TickerServiceProtocol {
    func tickerServiceDidComplited(ticker: Ticker, date: Date, chache: Bool) {
        bodyView.priceView.setPrice(price: ticker.USD.last, date: date)
        activityView.stopAnimating()
    }
    
    func tickerServiceDidFailed(_ serviceFail: ServiceFailure) {
        
    }
    
}


