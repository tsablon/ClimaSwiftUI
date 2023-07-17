//
//  WeatherRow.swift
//  ClimaSwiftUI
//
//  Created by Tracy on 17/07/2023.
//

import SwiftUI

struct WeatherRowView: View {
    
    let weatherViewModel: WeatherViewModel
    
    var body: some View {
        
        HStack {
            VStack(alignment: .leading) {
                Text(weatherViewModel.cityName)
                    .font(.system(size: 25, weight: .semibold))
                    .fixedSize(horizontal: false, vertical: true)
                
                Text(weatherViewModel.description)
                    .font(.system(size: 18))
                    .foregroundColor(Color.gray)
            }
            Spacer()
            VStack(alignment: .center) {
                Text(weatherViewModel.temperature)
                    .font(.system(size: 30))
                Image(systemName: weatherViewModel.iconName)
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
