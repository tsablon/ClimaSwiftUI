//
//  ContentView.swift
//  ClimaSwiftUI
//
//  Created by Tracy on 17/07/2023.
//

import SwiftUI

struct HomeScreen: View {
    
    @EnvironmentObject var weatherListViewModel: WeatherListViewModel
    
    var body: some View {
        NavigationStack {
            ZStack {
                LinearGradient(gradient: Gradient(colors: [Color.lightBlue, Color.midBlue, Color.darkBlue]), startPoint: .top, endPoint: .bottom)
                    .ignoresSafeArea()
                NavigationLink("Voir la meteo") {
                    WeatherListScreen()
                }
                .roundedButton()
                
            }.onAppear {
                print("Appear")
                weatherListViewModel.reset()
              
            }.onDisappear{
                print("disappear")
                weatherListViewModel.startLoading()
                
            }
            .navigationTitle("")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen().environmentObject(WeatherListViewModel())
    }
}
