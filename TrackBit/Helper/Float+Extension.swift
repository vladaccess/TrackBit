//
//  Float+Extension.swift
//  TrackBit
//
//  Created by Vladislav on 08.07.2018.
//  Copyright © 2018 Vladislav. All rights reserved.
//

import Foundation

extension Float {
    func toCurrency(_ fraction:Int? = nil) -> String? {
        let numberFormatter = NumberFormatter()
        numberFormatter.currencySymbol = "$"
        numberFormatter.locale = Locale.current
        numberFormatter.numberStyle = .currency
        numberFormatter.usesGroupingSeparator = true
        
        if let fraction = fraction {
            numberFormatter.minimumFractionDigits = fraction
            numberFormatter.maximumFractionDigits = fraction
        }else {
            numberFormatter.minimumFractionDigits = 2
            numberFormatter.maximumFractionDigits = 2
        }
        
        let number = NSNumber(value: self)
        return numberFormatter.string(from: number)
    }
    
    func toPercentString() -> String {
        var numberFormatter = NumberFormatter()
        numberFormatter.locale = Locale.current
        numberFormatter.numberStyle = .percent
        numberFormatter.usesGroupingSeparator = true
        numberFormatter.maximumFractionDigits = 1
        let number = NSNumber(value: self)
        return numberFormatter.string(from: number) ?? ""
    }
}
