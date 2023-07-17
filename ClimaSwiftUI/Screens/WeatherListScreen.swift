//
//  WeatherListScreen.swift
//  ClimaSwiftUI
//
//  Created by Tracy on 17/07/2023.
//

import SwiftUI

struct WeatherListScreen: View {
    
    @EnvironmentObject var weatherListViewModel: WeatherListViewModel
    
    var body: some View {
        
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color.lightBlue, Color.midBlue, Color.darkBlue]), startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            VStack {
                Spacer()
                if weatherListViewModel.loadingCompleted && weatherListViewModel.fetchCompleted {
                    WeatherListView()
                    ResetView()
    
                } else {
                    VStack {
                        Spacer()
                        IconLoadingView()
                        Spacer()
                        LoadingView()
                    }
                }
            }
            .navigationTitle("")
        }
    }
}

struct WeatherListScreen_Previews: PreviewProvider {
    static var previews: some View {
        WeatherListScreen().environmentObject(WeatherListViewModel())
        
    }
}
