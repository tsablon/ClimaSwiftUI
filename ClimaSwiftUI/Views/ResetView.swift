//
//  ResetView.swift
//  ClimaSwiftUI
//
//  Created by Tracy on 17/07/2023.
//

import SwiftUI

struct ResetView: View {
    
    @EnvironmentObject var weatherListViewModel: WeatherListViewModel
    
    var body: some View {
        
        Button("Recommencer",action:{
            weatherListViewModel.reset()
            weatherListViewModel.startLoading()
        })
        .roundedButton()
    }
}
