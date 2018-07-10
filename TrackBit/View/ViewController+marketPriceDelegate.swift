//
//  ViewController+marketPriceDelegate.swift
//  TrackBit
//
//  Created by Vladislav on 10.07.2018.
//  Copyright © 2018 Vladislav. All rights reserved.
//

import Foundation


extension ViewController:MarketPriceDelegate {
    func marketPriceDidComplite(_ marketPrice: MarketPrice) {
        var ref = "Week" //var ref = UserDefaults.standard.value(forKey: "") //Change issue
        let firstPrice = marketPrice.values.first?.axisY ?? 0
        let lastPrice = marketPrice.values.last?.axisY ?? 0
        var ref2 = ReferenceType.week
        
        bodyView.historyView.setPrice(firstPrice: firstPrice, lastPrice: lastPrice)
        bodyView.historyView.setPeriod(reference:ref2)
    }
    
    func marketPriceDidfailed(_ serviceFail: ServiceFailure) {
        
    }
    
    
}
