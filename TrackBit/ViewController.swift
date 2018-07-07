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

    }


}

extension ViewController:TickerServiceProtocol {
    func tickerServiceDidComplited(ticker: Ticker, date: Date, chache: Bool) {
        print("gfg")
        print(ticker.USD.last)
    }
    
    func tickerServiceDidFailed() {
        print("@@@")
    }
    
    
}



