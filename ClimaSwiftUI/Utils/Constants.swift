//
//  Constants.swift
//  ClimaSwiftUI
//
//  Created by Tracy on 17/07/2023.
//

import Foundation

struct Constants {
    static func weatherByCityName(_ cityname: String) -> URL? {
        return URL(string: "https://api.openweathermap.org/data/2.5/weather?q=\(cityname)&appid=e3bdb906d0286da20b3e3729dca31a73&units=metric&lang=fr")
    }
}
