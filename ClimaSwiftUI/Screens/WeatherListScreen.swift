//
//  WeatherListScreen.swift
//  ClimaSwiftUI
//
//  Created by Tracy on 17/07/2023.
//

import SwiftUI

struct WeatherListScreen: View {
    
    
    var body: some View {
        
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color.lightBlue, Color.midBlue, Color.darkBlue]), startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            VStack {
                WeatherListView()
                ResetView()
                IconLoadingView()
                LoadingView()
            }
            .navigationTitle("")
        }
        
    }
}

struct WeatherListScreen_Previews: PreviewProvider {
    static var previews: some View {
        WeatherListScreen()
        
    }
}
