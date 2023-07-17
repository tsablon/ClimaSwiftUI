//
//  WeatherListView.swift
//  ClimaSwiftUI
//
//  Created by Tracy on 17/07/2023.
//

import Foundation
import SwiftUI

struct WeatherListView: View {
    
    
    var body: some View {
        List {
            ForEach(0..<5) { weather in
                Section {
                    NavigationLink(destination: WeatherDetailScreen()) {
                        WeatherRowView()
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
