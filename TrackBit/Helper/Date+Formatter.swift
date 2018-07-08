//
//  Date+Formatter.swift
//  TrackBit
//
//  Created by Vladislav on 08.07.2018.
//  Copyright © 2018 Vladislav. All rights reserved.
//

import Foundation

extension Date {
    func toString(_ formatter:String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale.current
        dateFormatter.dateFormat = formatter
        return dateFormatter.string(from: self)
    }
    
    
    func fromString(date:String,dateFormatter:String) -> Date {
        let dateForm = DateFormatter()
        dateForm.dateFormat = dateFormatter
        dateForm.locale = Locale.current
        return dateForm.date(from: date) ?? Date()
    }
}
