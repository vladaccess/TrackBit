//
//  ViewController+marketPriceDelegate.swift
//  TrackBit
//
//  Created by Vladislav on 10.07.2018.
//  Copyright © 2018 Vladislav. All rights reserved.
//

import Foundation
import Charts


extension ViewController:MarketPriceDelegate {
    func marketPriceDidComplite(_ marketPrice: MarketPrice) {
        let ref = UserDefaults.standard.getReference()
        let firstPrice = marketPrice.values.first?.axisY ?? 0
        let lastPrice = marketPrice.values.last?.axisY ?? 0
        var values:[ChartDataEntry] = []
        for value in marketPrice.values {
            let x = Double(value.axisX)
            let y = Double(value.axisY)
            values.append(ChartDataEntry(x: x, y: y))
        }
        bodyView.historyView.setPrice(firstPrice: firstPrice, lastPrice: lastPrice)
        bodyView.historyView.setPeriod(reference:ref)
        bodyView.historyView.setChartData(ref: ref, values: values)
    }
    
    func marketPriceDidfailed(_ serviceFail: ServiceFailure) {
        
    }
    
    
}
