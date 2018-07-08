//
//  MarketPriceRouter.swift
//  TrackBit
//
//  Created by Vladislav on 08.07.2018.
//  Copyright © 2018 Vladislav. All rights reserved.
//

import Foundation
import Alamofire


enum MarketPriceRouter:URLRequestConvertible {
    
    case get([String:String])
    
    func asURLRequest() throws -> URLRequest {
        var request = URLRequest(url: APIService.Params.baseURL.appendingPathComponent(path))
        request.httpMethod = httpMethod.rawValue
        switch self {
        case .get(let params):
            request = try URLEncoding.default.encode(request, with: params)
            return request
        }
        
    }
    
    
    var path:String {
        switch self {
        case .get:
            return "/charts/market-price"
        }
    }
    
    var httpMethod:HTTPMethod {
        switch self {
        case .get:
            return .get
        }
    }
    
    
}
