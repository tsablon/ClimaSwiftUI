//
//  WeatherListView.swift
//  ClimaSwiftUI
//
//  Created by Tracy on 17/07/2023.
//

import Foundation
import SwiftUI

struct WeatherListView: View {
    
    @EnvironmentObject var weatherListViewModel: WeatherListViewModel
    
    var body: some View {
        List {
            ForEach(weatherListViewModel.weatherList) { weatherViewModel in
                Section {
                    NavigationLink(destination: WeatherDetailScreen(weatherViewModel: weatherViewModel)) {
                        WeatherRowView(weatherViewModel: weatherViewModel)
                    }
                }.listRowInsets(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: -20))
            }
        }
        .listStyle(InsetGroupedListStyle())
        .scrollContentBackground(.hidden)
    }
}

struct WeatherList_Previews: PreviewProvider {
    static var previews: some View {
        WeatherListView()
    }
}
