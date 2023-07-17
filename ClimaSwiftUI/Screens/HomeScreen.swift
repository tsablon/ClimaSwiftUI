//
//  ContentView.swift
//  ClimaSwiftUI
//
//  Created by Tracy on 17/07/2023.
//

import SwiftUI

struct HomeScreen: View {
    var body: some View {
        NavigationStack {
            ZStack {
                LinearGradient(gradient: Gradient(colors: [Color.lightBlue, Color.midBlue, Color.darkBlue]), startPoint: .top, endPoint: .bottom)
                    .ignoresSafeArea()
                NavigationLink("Voir la meteo") {

                }
                .roundedButton()
                
            }.onAppear {
                print("Appear")
              
            }.onDisappear{
                print("disappear")
                
            }
            .navigationTitle("")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
    }
}
