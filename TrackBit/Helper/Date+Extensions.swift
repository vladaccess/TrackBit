//
//  Date+Extensions.swift
//  TrackBit
//
//  Created by Vladislav on 08.07.2018.
//  Copyright © 2018 Vladislav. All rights reserved.
//

import Foundation


extension Date {
    func minus(days:Int) -> Date {
        return minusDate(days)
    }
    
    func minusDate(_ days:Int) -> Date {
        var dateComponents = DateComponents()
        dateComponents.day = -days
        return Calendar.current.date(byAdding: dateComponents, to: self) ?? Date()
    }
    
    func diff(date start:Date) -> Int {
        return Calendar.current.dateComponents([.year], from: start, to: self).year ?? 0
    }
    
    func startOfBitcoin() -> Date {
        let date = Date().fromString(date: "2009-01-03", dateFormatter: "yyyy-MM-dd")
        return date
    }
    
}


