//
//  ClimaSwiftUIApp.swift
//  ClimaSwiftUI
//
//  Created by Tracy on 17/07/2023.
//

import SwiftUI

@main
struct ClimaSwiftUIApp: App {
    
    @StateObject var weatherListViewModel = WeatherListViewModel()
    
    var body: some Scene {
        WindowGroup {
            HomeScreen()
                .environmentObject(weatherListViewModel)
        }
    }
}
