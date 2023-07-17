//
//  WeatherRow.swift
//  ClimaSwiftUI
//
//  Created by Tracy on 17/07/2023.
//

import SwiftUI

struct WeatherRowView: View {
    
    let weather = Weather(city: "Marseille", temperature: 28.41, temperatureMin: 24.92, temperatureMax: 29.26, pressure: 1012, humidity: 41, visibility: 10000, sunrise: Date(timeIntervalSince1970: TimeInterval(1689393754)), sunset: Date(timeIntervalSince1970: TimeInterval(1689450604)), description: "ciel dégagé", iconId: 800)
    
    var body: some View {
        
        HStack {
            VStack(alignment: .leading) {
                Text(weather.city)
                    .font(.system(size: 25, weight: .semibold))
                    .fixedSize(horizontal: false, vertical: true)
                
                Text(weather.description)
                    .font(.system(size: 18))
                    .foregroundColor(Color.gray)
            }
            Spacer()
            VStack(alignment: .center) {
                Text(weather.temperature.description)
                    .font(.system(size: 30))
                Image(systemName: "cloud")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 60, height: 60)
                
            }
            .padding(10)
            .background(Color.init(red:2/255, green: 48/255, blue: 71/255))
            .foregroundColor(.white)
            
        }
    }
}
