//
//  Weather.swift
//  WeatherApp
//
//  Created by sofien benharchache on 05/05/2019.
//  Copyright © 2019 sofien benharchache. All rights reserved.
//

import Foundation

//import Temperature
//import Pressure

// MARK: - Weather


struct WeatherDate {
    var date:Date
    var weather:[WeatherTime]
}

struct WeatherTime {
    let time:Date
    let temperature:Float
    let pressure:Float
    let rain:Float
    let humidity:Float
    let avgWind:Float
    let windGusts:Float
    let windDirection:Float
    let snowRisk:Bool
    
    func secondsToHoursMinutesSeconds (seconds : Int) -> (Int, Int, Int) {
        return (seconds / 3600, (seconds % 3600) / 60, (seconds % 3600) % 60)
    }
}


struct Weather {
    let temperature:Temperature
    let pressure:Pressure
    let rain:Float
    let convective_rain:Float
    let humidity:Humidity
    let avgWind:AvgWind
    let windGusts:WindGusts
    let windDirection:WindDirection
    let iso_zero:String
    let snowRisk:String
    let cape:Float
    let nebulosity:Nebulosity
}

extension Weather: Decodable {
    enum WeatherTimeCodingKeys: String, CodingKey {
        case temperature = "temperature"
        case rain = "pluie"
        case convective_rain = "pluie_convective"
        case pressure = "pression"
        case humidity = "humidite"
        case avgWind = "vent_moyen"
        case windGusts = "vent_rafales"
        case windDirection = "vent_direction"
        case iso_zero = "iso_zero"
        case snowRisk = "risque_neige"
        case cape = "cape"
        case nebulosity = "nebulosite"
    }
    
    init(from decoder: Decoder) throws {
        let weatherTimeContainer = try decoder.container(keyedBy: WeatherTimeCodingKeys.self)
        
        temperature = try weatherTimeContainer.decode(Temperature.self, forKey: .temperature)
        pressure = try weatherTimeContainer.decode(Pressure.self, forKey: .pressure)
        humidity = try weatherTimeContainer.decode(Humidity.self, forKey: .humidity)
        rain = try weatherTimeContainer.decode(Float.self, forKey: .rain)
        convective_rain = try weatherTimeContainer.decode(Float.self, forKey: .convective_rain)
        avgWind = try weatherTimeContainer.decode(AvgWind.self, forKey: .avgWind)
        windGusts = try weatherTimeContainer.decode(WindGusts.self, forKey: .windGusts)
        windDirection = try weatherTimeContainer.decode(WindDirection.self, forKey: .windDirection)
        iso_zero = try weatherTimeContainer.decode(String.self, forKey: .iso_zero)
        snowRisk = try weatherTimeContainer.decode(String.self, forKey: .snowRisk)
        cape = try weatherTimeContainer.decode(Float.self, forKey: .cape)
        nebulosity = try weatherTimeContainer.decode(Nebulosity.self, forKey: .nebulosity)
    }
}

// MARK: -
struct Humidity {
    let m_2:Float
}

extension Humidity: Decodable {
    enum humidityCodingKeys: String, CodingKey {
        case m_2 = "2m"
    }
    
    init(from decoder: Decoder) throws {
        let humidityContainer = try decoder.container(keyedBy: humidityCodingKeys.self)
        m_2 = try humidityContainer.decode(Float.self, forKey: .m_2)
    }
}



// MARK: -
struct AvgWind {
    let m_10:Float
}

extension AvgWind: Decodable {
    enum AvgWindCodingKeys: String, CodingKey {
        case m_10 = "10m"
    }
    
    init(from decoder: Decoder) throws {
        let avgWindContainer = try decoder.container(keyedBy: AvgWindCodingKeys.self)
        m_10 = try avgWindContainer.decode(Float.self, forKey: .m_10)
    }
}





// MARK: -
struct WindGusts {
    let m_10:Float
}

extension WindGusts: Decodable {
    enum WindGustsCodingKeys: String, CodingKey {
        case m_10 = "10m"
    }
    
    init(from decoder: Decoder) throws {
        let windGustsContainer = try decoder.container(keyedBy: WindGustsCodingKeys.self)
        m_10 = try windGustsContainer.decode(Float.self, forKey: .m_10)
    }
}


// MARK: -
struct WindDirection {
    let m_10:Float
}

extension WindDirection: Decodable {
    enum WindDirectionCodingKeys: String, CodingKey {
        case m_10 = "10m"
    }
    
    init(from decoder: Decoder) throws {
        let windDirectionContainer = try decoder.container(keyedBy: WindDirectionCodingKeys.self)
        m_10 = try windDirectionContainer.decode(Float.self, forKey: .m_10)
    }
}




// MARK: -
struct Nebulosity {
    let hight:Float
    let average:Float
    let low:Float
    let total:Float
}

extension Nebulosity: Decodable {
    enum NebulosityCodingKeys: String, CodingKey {
        case hight = "haute"
        case average = "moyenne"
        case low = "basse"
        case total = "totale"
    }
    
    init(from decoder: Decoder) throws {
        let nebulosityContainer = try decoder.container(keyedBy: NebulosityCodingKeys.self)
        hight = try nebulosityContainer.decode(Float.self, forKey: .hight)
        average = try nebulosityContainer.decode(Float.self, forKey: .average)
        low = try nebulosityContainer.decode(Float.self, forKey: .low)
        total = try nebulosityContainer.decode(Float.self, forKey: .total)
    }
}

// MARK: - Temperature

struct Temperature {
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

// MARK: - Pressure
struct Pressure {
    let sea_level:Int
}

extension Pressure: Decodable {
    enum PressureCodingKeys: String, CodingKey {
        case sea_level = "niveau_de_la_mer"
    }
    
    init(from decoder: Decoder) throws {
        let pressureContainer = try decoder.container(keyedBy: PressureCodingKeys.self)
        
        sea_level = try pressureContainer.decode(Int.self, forKey: .sea_level)
    }
}

