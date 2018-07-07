//
//  APIService.swift
//  TrackBit
//
//  Created by Vladislav on 08.07.2018.
//  Copyright © 2018 Vladislav. All rights reserved.
//

import Foundation
import Alamofire

class APIService {
    var session:SessionManager = {
        let conf = URLSessionConfiguration.default
        conf.timeoutIntervalForRequest = Params.timeout
        conf.timeoutIntervalForResource = Params.timeout
        return SessionManager(configuration:conf)
    }()
    
    
    struct Params {
        static let baseURL:URL = URL(string:"https://api.blockchain.info")!
        static let timeout = 15.0
    }
    
}

