//
//  MarketPriceApiService.swift
//  TrackBit
//
//  Created by Vladislav on 08.07.2018.
//  Copyright © 2018 Vladislav. All rights reserved.
//

import Foundation
import Alamofire

class MarketPriceApiService {
    
    func get(referenceType:ReferenceType,success:@escaping((Data)->Void),failure:@escaping ((ServiceFailure)->Void)) {
        
        let parameters = parametersFunc(referenceType)
        
        request(MarketPriceRouter.get(parameters))
        .validate(statusCode: [200])
            .responseJSON { (response) in
                guard let data = response.data else {
                    failure(.connection)
                    return
                }
                
                if let error = response.error {
                    if error as? AFError == nil {
                        failure(.connection)
                    }else {
                        failure(.server)
                    }
                }
                
                success(data)
        }
    }
    
    private func parametersFunc(_ referenceType:ReferenceType) -> [String:String]{
        var start:Date
        var timespan:String
        
        switch referenceType {
        case .week:
            timespan = "1week"
            start = Date().minus(days:7)
        case .month:
            timespan = "1month"
            start = Date().minus(days:30)
        case .year:
            timespan = "1year"
            start = Date().minus(days:360)
        case .all:
            start = Date().startOfBitcoin()
            timespan = "\(Date().diff(date: start))year"
        }
        
        var dict:[String:String] = [:]
        dict["start"] = start.toString("yyyy-MM-dd")
        dict["timespan"] = timespan
        dict["format"] = "json"
        
        return dict
    }
    
}
