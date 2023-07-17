//
//  WeatherDetailScreen.swift
//  ClimaSwiftUI
//
//  Created by Tracy on 17/07/2023.
//

import SwiftUI

struct WeatherDetailScreen: View {

    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color.lightBlue, Color.midBlue, Color.darkBlue]), startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            VStack {
                Spacer()
                List {
                    Section {
                        HStack(alignment: .center) {
                            VStack {
                                Text("Text").font(.system(size:50, weight: .light)).foregroundColor(Color.white)
                                Text("Text").font(.system(size:30, weight: .light)).foregroundColor(Color.white)
                                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 10, trailing: 0))
                                HStack {
                                    Label("Text", systemImage: "arrow.down").font(.title3)
                                    Label("Text", systemImage: "arrow.up").font(.title3)
                                }.foregroundColor(Color.white)
                                Divider()
                                Label("Text".description, systemImage: "cloud").font(.title3).foregroundColor(Color.lightBlue)
                            }
                            
                            Spacer()
                        }
                    }.listRowBackground(Color.clear)
                    Section(header: Label("lever", systemImage: "sunset").font(.title) ) {
                        VStack(alignment: .leading) {
                            Text("Text").font(.title)
                            Text("Text").font(.caption)
                        }.foregroundColor(Color.white)
                        
                        
                    }.listRowBackground(Color.clear)
                    Section(header: Label("humidity", systemImage: "drop").font(.title) ) {
                        VStack(){
                            Text("Text").font(.title).foregroundColor(Color.white)
                        }
                    }.listRowBackground(Color.clear)
                    
                    Section(header: Label("visibilité", systemImage: "eye").font(.title) ) {
                        Text("Text").font(.title)
                            .foregroundColor(Color.white)
                    }.listRowBackground(Color.clear)
                    
                    Section(header: Label("Pression", systemImage: "barometer").font(.title)
                    ) {
                        VStack(alignment: .leading) {
                            Text("Text").font(.title)
                                .foregroundColor(Color.white)
                        }
                        
                    }.listRowBackground(Color.clear)
                    
                }
                .scrollContentBackground(.hidden)
                .navigationTitle("")
            }
        }
        
    }
}

struct WeatherDetailScreen_Previews: PreviewProvider {
    static var previews: some View {
        WeatherDetailScreen()
        
    }
}
