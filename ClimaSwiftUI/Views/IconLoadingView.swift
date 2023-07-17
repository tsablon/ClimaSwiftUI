//
//  IconLoadingView.swift
//  ClimaSwiftUI
//
//  Created by Tracy on 17/07/2023.
//

import SwiftUI

struct IconLoadingView: View {
    
    @EnvironmentObject var weatherListViewModel: WeatherListViewModel
    
    @State var timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @State var counter = 0
    
    var body: some View {
        Image(systemName: IconWeather.allCases[counter].image)
            .resizable()
            .scaledToFit()
            .frame(width: 100, height: 100)
            .foregroundColor(Color.white)
        .onReceive(timer) { _ in
           counter += 1

            if counter == IconWeather.allCases.count - 1 {
                counter = 0
            }
            
            if weatherListViewModel.loadingCompleted && weatherListViewModel.fetchCompleted {
                timer.upstream.connect().cancel()
            }
           
        }
    }
}
