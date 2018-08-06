//
//  ViewController.swift
//  TrackBit
//
//  Created by Vladislav on 07.07.2018.
//  Copyright © 2018 Vladislav. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
    
    @IBOutlet weak var bodyView:BodyView!
    @IBOutlet weak var headerView:HeaderView!
    @IBOutlet weak var bottomView:BottomView!
    @IBOutlet weak var activityView:UIActivityIndicatorView!
    
    
    var tickerService = TickerService()
    var marketPriceService = MarketPriceService()

    override func viewDidLoad() {
        super.viewDidLoad()
        bodyView.amendShadow()
        callTickerService()
        callMarketPriceService(refType: UserDefaults.standard.getReference())
        headerView.delegate = self
        bottomView.delegate = self
        bottomView.setReference(UserDefaults.standard.getReference())
        tickerService.delegate = self
        marketPriceService.delegate = self
    }
    
    func callTickerService() {
        activityView.startAnimating()
        tickerService.get()
    }
    
    func callMarketPriceService(refType:ReferenceType) {
        activityView.startAnimating()
        marketPriceService.get(referenceType: refType)
    }
    
    
    


}

extension ViewController:BottomViewDelegate {
    func buttonTappedWith(_ ref: ReferenceType) {
        UserDefaults.standard.setReference(ref: ref)
        callMarketPriceService(refType: ref)
    }
    
}






