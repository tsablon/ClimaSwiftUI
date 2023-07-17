//
//  IconWeather.swift
//  ClimaSwiftUI
//
//  Created by Tracy on 17/07/2023.
//

import Foundation

enum IconWeather: Int, CaseIterable {
    case sun, sunAndCloud, bolt, drizzle, rain, snow, fog, cloud
    
    var image: String {
        switch self {
        case .sun:
            return "sun.max"
        case .sunAndCloud:
            return "cloud.sun.rain"
        case .bolt:
            return "cloud.bolt"
        case .drizzle:
            return "cloud.drizzle"
        case .rain:
            return "cloud.rain"
        case .snow:
            return "cloud.snow"
        case .fog:
            return "cloud.fog"
        case .cloud:
            return "cloud"
        }
    }
}
