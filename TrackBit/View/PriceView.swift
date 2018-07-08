//
//  PriceView.swift
//  TrackBit
//
//  Created by Vladislav on 08.07.2018.
//  Copyright © 2018 Vladislav. All rights reserved.
//

import UIKit

class PriceView:UIView {
    
    @IBOutlet weak var dateLabel:UILabel!
    @IBOutlet weak var priceLabel:UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        dateLabel.text = "_"
        priceLabel.text = "_"
    }
    
    func setPrice(price:Float, date:Date?) {
        guard let stringPrice = price.toCurrency() else { return }
        dateLabel.text = stringPrice
        //Show animation
        
        if let date = date {
            setDate(date)
        }
    }
    
    private func setDate(_ date:Date) {
        let dateFormatter = "dd-MM-yyyy hh:mm a"
        dateLabel.text = date.toString(dateFormatter)
        //Show animation
    }
}
