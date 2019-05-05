//
//  WeatherNetworkManager.swift
//  WeatherApp
//
//  Created by sofien benharchache on 05/05/2019.
//  Copyright © 2019 sofien benharchache. All rights reserved.
//

import Foundation
import BSNetworking

enum NetworkResponse:String {
    case success
    case authenticationError = "Bad key authentication."
    case badRequest = "Bad request."
    case outdated = "The url you requested is outdated."
    case failed = "Network request failed."
    case unableToDecode = "We could not decode the response."
    case bandwidthLimitExceeded = "Bandwidth Limit Exceeded."
    case conflict = "Conflict."
    case noData = "no data."
}

enum Result<String> {
    case success
    case failure(String)
}

struct NetworkManager {
    static let environment: NetworkEnvironment = .production
    static let WeatherAPIKey = ""
    private let router = Router<WeatherApi>()
    
    func getWeather(latitude: Double, longitude: Double,
                    completion: @escaping (_ weather: [Int]?,_ error: String?)->()){
        router.request(.weather(longitude: latitude, latitude: longitude)) { data, response, error in
            if error != nil {
                completion(nil, "Please check your network connection.")
            }
            
            if let response = response as? HTTPURLResponse {
                let result = self.handleNetworkResponse(response)
                switch result {
                case .success:
                    print("success")
                    guard let responseData = data else {
                        completion(nil, NetworkResponse.noData.rawValue)
                        return
                    }
                    do {
                        let jsonData = try JSONSerialization.jsonObject(with: responseData, options: .mutableContainers)
                        print(jsonData)

                        completion(nil, nil)
                        
                    } catch {
                        print(error)
                        completion(nil, NetworkResponse.unableToDecode.rawValue)
                    }
                case .failure(let networkFailureError):
                    print("failure")
                    completion(nil, networkFailureError)
                }
                
            }
            
        }
    }
    
    
    fileprivate func handleNetworkResponse(_ response:HTTPURLResponse) -> Result<String>{
        switch response.statusCode {
        case 200...299: return .success
        case 409: return .failure(NetworkResponse.conflict.rawValue)
        case 401...500: return .failure(NetworkResponse.authenticationError.rawValue)
        case 509: return .failure(NetworkResponse.bandwidthLimitExceeded.rawValue)
        case 501...599: return .failure(NetworkResponse.badRequest.rawValue)
        case 600: return .failure(NetworkResponse.outdated.rawValue)
        default: return .failure(NetworkResponse.failed.rawValue)
        }
    }
}
