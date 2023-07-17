//
//  LoadingView.swift
//  ClimaSwiftUI
//
//  Created by Tracy on 17/07/2023.
//

import SwiftUI

struct LoadingView: View {

    @EnvironmentObject var weatherListViewModel: WeatherListViewModel
    
    var body: some View {
        ProgressView(value: Float(weatherListViewModel.progressValue), total: 60) {
            Text(weatherListViewModel.message)
                .fixedSize(horizontal: false, vertical: true)
                .padding(EdgeInsets(top: 0, leading: 0, bottom: 10, trailing: 0))
        }
        .padding(EdgeInsets(top: 20, leading: 20, bottom: 40, trailing: 20))
        .foregroundColor(Color.white)
        .tint(Color.yellow)
        .frame(height: 70)
    }
}
