//
//  WeatherEndPoint.swift
//  WeatherApp
//
//  Created by sofien benharchache on 05/05/2019.
//  Copyright © 2019 sofien benharchache. All rights reserved.
//

import Foundation

import BSNetworking

public enum WeatherApi {
    case weather(longitude:Double, latitude:Double)
}

extension WeatherApi: EndPointType {
    var environmentBaseURL: String {
        switch NetworkManager.environment  {
        case .production: return "https://www.infoclimat.fr/public-api/gfs/json"
        case .qa: return "https://www.infoclimat.fr/public-api/gfs/json"
        case .staging: return "https://www.infoclimat.fr/public-api/gfs/json"
        }
    }
    
    public var baseURL: URL {
        guard let url = URL(string: environmentBaseURL) else { fatalError("baseURL could not be configured.")}
        return url
    }
    
    public var path: String {
        switch self {
        case .weather( _, _):
            return ""
        }
    }
    
    public var httpMethod: HTTPMethod {
        return .get
    }
    
    public var task: HTTPTask {
        switch self {
        case .weather(let longitude, let latitude):
            let location = "\(latitude),\(longitude)"
            let authentication: String = "BhwDFAd5ByVSfwYxUiRReFgwUGUBd1N0VytSMQlsVCkDaAJjAmIAZlc5Ui8BLgcxAy4HZFxnADBROlIqAXNUNQZsA28HbAdgUj0GY1J9UXpYdlAxASFTdFc1UjIJYlQpA2ECYAJhAHxXOVI4ATMHLQMyB2JcZwAnUS1SNAFpVDIGYwNuB2UHYlI1BmJSYlF6WHRQNQFtUzhXZ1JkCTFUMQNkAjICZgBgVzFSMwE3By0DMgdhXGAAPlE2UjcBa1QxBnoDeAcdBxZSIAYkUiBRMFgtUC0Ba1M1V2A="
            let key = "97499e4b4b4863b478d736882cbab396"
            return .requestParameters(bodyParameters:nil,
                                      urlParameters:["_ll":location, "_auth":authentication, "_c":key])
        }
    }
    
    public var headers: HTTPHeaders? {
        return nil
    }
}
