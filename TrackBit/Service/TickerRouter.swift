//
//  TickerRouter.swift
//  TrackBit
//
//  Created by Vladislav on 07.07.2018.
//  Copyright © 2018 Vladislav. All rights reserved.
//

import Foundation
import Alamofire

enum TickerRouter:URLRequestConvertible {
    
    
    case get()
    
    func asURLRequest() throws -> URLRequest {
        var request = URLRequest(url: APIService.Params.baseURL.appendingPathComponent(path))
        print(request.url!)
        request.httpMethod = method.rawValue
        
        
        switch self {
        case .get():
            let encodedReq = try URLEncoding.default.encode(request, with: nil)
            return encodedReq
        }
        
    }
    
    
    var path:String {
        switch self {
        case .get(): return "/ticker"
        }
    }
    
    var method:HTTPMethod {
        switch self {
        case .get(): return HTTPMethod.get
        }
    }

    
}
