//
//  WeatherService.swift
//  ClimaSwiftUI
//
//  Created by Tracy on 17/07/2023.
//

import Foundation


protocol WeatherServiceProtocol {
    func request(city: String) async -> Result<Weather, NetworkError>
}


class WeatherService: WeatherServiceProtocol {
    
    func request(city: String) async -> Result<Weather, NetworkError> {
        
        guard let url = Constants.weatherByCityName(city) else {
            return .failure(.wrongUrl)
        }
      
        do {
            let(data, response) =  try await URLSession.shared.data(from: url)
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                return .failure(.serverError)
            }
            
            guard let weatherResponse = try? JSONDecoder().decode(WeatherResponse.self, from: data) else {
                return .failure(.decodingError)
            }
            
            return .success(weatherResponse.weather)
            
        } catch {
            return .failure(.unknown)
        }
    }
}
