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
    
    
    var tickerService = TickerService()

    override func viewDidLoad() {
        super.viewDidLoad()
        callTickerService()
        //callTickerService()
        headerView.delegate = self
        tickerService.delegate = self
    }
    
    func callTickerService() {
        tickerService.get()
    }


}






