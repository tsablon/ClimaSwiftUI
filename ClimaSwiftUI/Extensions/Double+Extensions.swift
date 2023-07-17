//
//  Double+Extensions.swift
//  ClimaSwiftUI
//
//  Created by Tracy on 17/07/2023.
//

import Foundation

extension Double {
    
    var toCelsius: Measurement<UnitTemperature> {
        return Measurement(value: self, unit: UnitTemperature.celsius)
    }
}
