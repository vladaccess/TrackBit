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
        var distance:String
        
        switch referenceType {
        case .week: break
        case .month: break
        case .year: break
        case .all: break
        }
        
        var dict = [String:String]()
        //need to translate date to string
        dict["start"] = //start
        dict["distance"] = distance
        dict["format"] = "json"
        
        return dict
    }
    
}
