//
//  ViewController.swift
//  TrackBit
//
//  Created by Vladislav on 07.07.2018.
//  Copyright © 2018 Vladislav. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let service = TickerService()
        service.delegate = self
        service.get()
        
        let service2 = MarketPriceService()
        service2.delegate = self
        service2.get(referenceType: .month)

    }


}

extension ViewController:TickerServiceProtocol {
    func tickerServiceDidComplited(ticker: Ticker, date: Date, chache: Bool) {
    
    }
    
    func tickerServiceDidFailed(_ serviceFail: ServiceFailure) {
        
    }
    
    
}

extension ViewController:MarketPriceDelegate {
    func marketPriceDidComplite(_ marketPrice: MarketPrice) {
        
    }
    
    func marketPriceDidfailed(_ serviceFail: ServiceFailure) {
    }
    
    
}



