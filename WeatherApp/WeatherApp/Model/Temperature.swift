//
//  Temperature.swift
//  WeatherApp
//
//  Created by sofien benharchache on 05/05/2019.
//  Copyright © 2019 sofien benharchache. All rights reserved.
//

import Foundation

// MARK: - Temperature

/*struct Temperature {
    let m_2:Float
    let ground:Float
    let pressure_500:Float
    let pressure_850:Float
}

extension Temperature: Decodable {
    enum TemperatureCodingKeys: String, CodingKey {
        case m_2 = "2m"
        case ground = "sol"
        case pressure_500 = "500hPa"
        case pressure_850 = "850hPa"
    }
    
    init(from decoder: Decoder) throws {
        let temperatureContainer = try decoder.container(keyedBy: TemperatureCodingKeys.self)
        
        m_2 = try temperatureContainer.decode(Float.self, forKey: .m_2)
        ground = try temperatureContainer.decode(Float.self, forKey: .ground)
        pressure_500 = try temperatureContainer.decode(Float.self, forKey: .pressure_500)
        pressure_850 = try temperatureContainer.decode(Float.self, forKey: .pressure_850)
    }
}
*/
