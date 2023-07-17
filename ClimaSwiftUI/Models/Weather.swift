//
//  Weather.swift
//  ClimaSwiftUI
//
//  Created by Tracy on 17/07/2023.
//

import Foundation

struct WeatherResponse: Decodable {
    let name: String
    var weather: Weather
    let icon: [WeatherIcon]
    let visibility: Int
    let sys: Sys
    
    private enum CodingKeys: String, CodingKey {
        case name
        case weather = "main"
        case icon = "weather"
        case visibility
        case sys
    }
    
    enum WeatherKeys: String, CodingKey {
        case temperature = "temp"
        case temperatureMin = "temp_min"
        case temperatureMax = "temp_max"
        case pressure = "pressure"
        case humidity = "humidity"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        name = try container.decode(String.self, forKey: .name)
        icon = try container.decode([WeatherIcon].self, forKey: .icon)
        visibility = try container.decode(Int.self, forKey: .visibility)
        sys = try container.decode(Sys.self, forKey: .sys)
        
        let weatherContainer = try container.nestedContainer(keyedBy: WeatherKeys.self, forKey: .weather)
        let temperature = try weatherContainer.decode(Double.self, forKey: .temperature)
        let temperatureMin = try weatherContainer.decode(Double.self, forKey: .temperatureMin)
        let temperatureMax = try weatherContainer.decode(Double.self, forKey: .temperatureMax)
        let pressure = try weatherContainer.decode(Int.self, forKey: .pressure)
        let humidity = try weatherContainer.decode(Int.self, forKey: .humidity)
        
        weather = Weather(city: name, temperature: temperature, temperatureMin: temperatureMin, temperatureMax: temperatureMax, pressure: pressure, humidity: humidity, visibility: visibility, sunrise: sys.sunrise, sunset: sys.sunset, description: icon.first!.description, iconId: icon.first!.id)
    }
}

struct WeatherIcon: Decodable {
    let description: String
    let id: Int
    let icon: String
}
struct Sys: Decodable {
    let sunrise: Date
    let sunset: Date
    
    private enum CodingKeys: String, CodingKey {
        case sunrise = "sunrise"
        case sunset = "sunset"
        
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let sunriseTimeIntervel = try container.decode(Int32.self, forKey: .sunrise)
        let sunsetTimeIntervel = try container.decode(Int32.self, forKey: .sunset)
        sunrise = Date(timeIntervalSince1970: TimeInterval(sunriseTimeIntervel))
        sunset = Date(timeIntervalSince1970: TimeInterval(sunsetTimeIntervel))
    }
}

struct Weather : Identifiable {
    var id = UUID()
    let city: String
    let temperature: Double
    let temperatureMin: Double
    let temperatureMax: Double
    let pressure: Int
    let humidity: Int
    let visibility: Int
    let sunrise: Date
    let sunset: Date
    let description: String
    let iconId: Int
}
