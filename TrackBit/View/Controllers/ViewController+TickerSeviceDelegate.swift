//
//  ViewController+Delegate.swift
//  TrackBit
//
//  Created by Vladislav on 09.07.2018.
//  Copyright © 2018 Vladislav. All rights reserved.
//

import Foundation

extension ViewController:TickerServiceProtocol {
    func tickerServiceDidComplited(ticker: Ticker, date: Date, cache: Bool) {
        bodyView.priceView.setPrice(price: ticker.USD.last, date: date)
        if cache {
            SwiftBannerManager.shared.show(state: .connection)
        }
        activityView.stopAnimating()
    }
    
    func tickerServiceDidFailed(_ serviceFail: ServiceFailure) {
        bodyView.priceView.setPrice(price: 0)
        activityView.stopAnimating()
        switch serviceFail {
        case .connection:
            SwiftBannerManager.shared.show(state: .connection)
        case .server:
            SwiftBannerManager.shared.show(state: .server)
        }
    }
    
}


