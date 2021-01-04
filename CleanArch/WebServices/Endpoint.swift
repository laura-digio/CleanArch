//
//  Endpoint.swift
//  CleanArch
//
//  Created by Laura on 14/09/2020.
//  Copyright © 2020 DIGIO. All rights reserved.
//

import UIKit
import Alamofire

protocol Endpoint: URLRequestConvertible {
    var subpath: String { get }
    var method: HTTPMethod { get }
    var params: [String: Any]? { get }
    var bodyParams: [String: Any]? { get }
}

extension Endpoint  {
    
    var params: [String : Any]? {
        return nil
    }
    
    var bodyParams: [String : Any]? {
        return nil
    }
    
    func asURLRequest() throws -> URLRequest {
        let baseURL = try NetworkClientConstants.baseURL.asURL()
        let request = URLRequest(url: baseURL.appendingPathComponent(subpath))
        
        var encodedRequest = try URLEncoding.queryString.encode(request, with: params)
        encodedRequest.httpMethod = method.rawValue
        encodedRequest.httpBody = bodyParams?
            .map({ $0.key.transform(value: $0.value) })
            .joined(separator: "&")
            .data(using: .utf8)
        
        return encodedRequest
    }
}
