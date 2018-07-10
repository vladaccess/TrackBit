//
//  HistoryView.swift
//  TrackBit
//
//  Created by Vladislav on 08.07.2018.
//  Copyright © 2018 Vladislav. All rights reserved.
//

import UIKit

class HistoryView:UIView {
    
    @IBOutlet weak var percentLabel:UILabel!
    @IBOutlet weak var arrowImage:UIImageView!
    @IBOutlet weak var periodLabel:UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        percentLabel.sizeToFit()
    }
    
    
    func setPeriod(reference:ReferenceType) {
        var text:String
        switch reference {
        case .all: text = "All"
        case .month: text = "Month"
        case .week: text = "Week"
        case .year: text = "Year"
        }
        periodLabel.text = text
    }
    
    
    func setPrice(firstPrice:Float, lastPrice:Float) {
        let diff = lastPrice - firstPrice
        var image:UIImage?
        var color:UIColor
        if diff == 0 {
            color = UIColor.gray
            image = nil
        }else if diff > 0 {
            image = #imageLiteral(resourceName: "upArrow_icon")
            color = UIColor.green
        }else {
            image = #imageLiteral(resourceName: "downArrow_icon")
            color = UIColor.red
        }
        arrowImage.image = image
        percentLabel.textColor = color
        setPercent(firstPrice, lastPrice)
    }
    
    private func setPercent(_ firstPrice:Float, _ lastPrice:Float) {
        let percent = abs(1 - (lastPrice / firstPrice))
        let stringPercent = percent.toPercentString()
        percentLabel.text = stringPercent
    }
}
