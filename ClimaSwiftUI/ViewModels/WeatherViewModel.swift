//
//  WeatherViewModel.swift
//  ClimaSwiftUI
//
//  Created by Tracy on 17/07/2023.
//

import Foundation

class WeatherViewModel : Identifiable {
    
    let id = UUID()
    
    let weather: Weather
    
    init(weather: Weather) {
        self.weather = weather
    }
    
    var cityName: String {
        return weather.city.capitalized
    }
    
    var description: String {
        return weather.description
    }
    
    var temperature: String {
        return ""
    }
    
    var temperatureMin: String {
        return ""
    }
    
    var temperatureMax: String {
        return ""
    }
    
    var sunrise: String {
        
        let dateString2 = weather.sunrise.description

        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss z"
        dateFormatter.locale = .current

        let dateObj = dateFormatter.date(from: dateString2)
        dateFormatter.dateFormat = "HH:mm"
        
        return dateFormatter.string(from: dateObj!)
    }
    
    var sunset: String {
        
        let dateString2 = weather.sunset.description

        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss z"
        dateFormatter.locale = .current

        let dateObj = dateFormatter.date(from: dateString2)
        dateFormatter.dateFormat = "HH:mm"
        
        return dateFormatter.string(from: dateObj!)
    }
    
    var humidity: String {
        return "\(weather.humidity) %"
    }
    
    var visibility: String {
        let meter = weather.visibility
        return "\(meter/1000) km"
    }
    
    var pressure: String {
        return "\(weather.pressure) hPa"
    }
    
    var iconName: String {
        switch weather.iconId {
        case 200...232:
            return IconWeather.bolt.image
        case 300...321:
            return IconWeather.drizzle.image
        case 500...531:
            return IconWeather.rain.image
        case 600...622:
            return IconWeather.snow.image
        case 700...781:
            return IconWeather.fog.image
        case 800:
            return IconWeather.sun.image
        case 801...804:
            return IconWeather.cloud.image
        default:
            return IconWeather.cloud.image
        }
    }
}
