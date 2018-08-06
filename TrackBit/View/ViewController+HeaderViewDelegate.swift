//
//  ViewController+HeaderViewDelegate.swift
//  TrackBit
//
//  Created by Vladislav on 09.07.2018.
//  Copyright © 2018 Vladislav. All rights reserved.
//

import Foundation


extension ViewController:HeaderViewDelegate {
    func refreshButtonTapped() {
        callTickerService()
        let reference = UserDefaults.standard.getReference()
        callMarketPriceService(refType: reference)
    }
}
