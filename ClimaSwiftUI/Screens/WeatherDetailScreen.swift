//
//  WeatherDetailScreen.swift
//  ClimaSwiftUI
//
//  Created by Tracy on 17/07/2023.
//

import SwiftUI

struct WeatherDetailScreen: View {

    let weatherViewModel: WeatherViewModel
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color.lightBlue, Color.midBlue, Color.darkBlue]), startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            VStack {
                Spacer()
                List {
                    Section {
                        HStack(alignment: .center) {
                            VStack {
                                Text(weatherViewModel.cityName).font(.system(size:50, weight: .light)).foregroundColor(Color.white)
                                Text(weatherViewModel.temperature).font(.system(size:30, weight: .light)).foregroundColor(Color.white)
                                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 10, trailing: 0))
                                HStack {
                                    Label(weatherViewModel.temperatureMin, systemImage: "arrow.down").font(.title3)
                                    Label(weatherViewModel.temperatureMax, systemImage: "arrow.up").font(.title3)
                                }.foregroundColor(Color.white)
                                Divider()
                                Label(weatherViewModel.description, systemImage: weatherViewModel.iconName).font(.title3).foregroundColor(Color.lightBlue)
                            }
                            
                            Spacer()
                        }
                    }.listRowBackground(Color.clear)
                    Section(header: Label("lever", systemImage: "sunset").font(.title) ) {
                        VStack(alignment: .leading) {
                            Text(weatherViewModel.sunrise).font(.title)
                            Text("coucher: \(weatherViewModel.sunset)").font(.caption)
                        }.foregroundColor(Color.white)
                        
                        
                    }.listRowBackground(Color.clear)
                    Section(header: Label("humidity", systemImage: "drop").font(.title) ) {
                        VStack(){
                            Text(weatherViewModel.humidity.description).font(.title).foregroundColor(Color.white)
                        }
                    }.listRowBackground(Color.clear)
                    
                    Section(header: Label("visibilité", systemImage: "eye").font(.title) ) {
                        Text(weatherViewModel.visibility.description).font(.title)
                            .foregroundColor(Color.white)
                    }.listRowBackground(Color.clear)
                    
                    Section(header: Label("Pression", systemImage: "barometer").font(.title)
                    ) {
                        VStack(alignment: .leading) {
                            Text(weatherViewModel.pressure.description).font(.title)
                                .foregroundColor(Color.white)
                        }
                        
                    }.listRowBackground(Color.clear)
                    
                }
                .scrollContentBackground(.hidden)
                .navigationTitle("")
            }
        }
        
    }
}

struct WeatherDetailScreen_Previews: PreviewProvider {
    static var previews: some View {
        WeatherDetailScreen(weatherViewModel: WeatherViewModel(weather: Weather(city: "Marseille", temperature: 28.41, temperatureMin: 24.92, temperatureMax: 29.26, pressure: 1012, humidity: 41, visibility: 10000, sunrise: Date(timeIntervalSince1970: TimeInterval(1689393754)), sunset: Date(timeIntervalSince1970: TimeInterval(1689450604)), description: "ciel dégagé", iconId: 800) ))
    }
}
