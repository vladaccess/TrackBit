//
//  TickerApiService.swift
//  TrackBit
//
//  Created by Vladislav on 07.07.2018.
//  Copyright © 2018 Vladislav. All rights reserved.
//

import UIKit
import Alamofire

class TickerApiService {
    
    
    func get(success:@escaping (Data)->Void,failure:@escaping(ServiceFailure)->Void) {
        request(TickerRouter.get())
            .responseJSON(completionHandler: { (response) in
                guard let data = response.data else {
                    failure(.connection)
                    return
                }
                
                if let error = response.error as? AFError {
                    failure(.connection)
                }else {
                    failure(.server)
                }
                
                
                success(data)
                
            })
        
    }
}
