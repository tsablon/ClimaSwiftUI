//
//  IconLoadingView.swift
//  ClimaSwiftUI
//
//  Created by Tracy on 17/07/2023.
//

import SwiftUI

struct IconLoadingView: View {

    @State var timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @State var counter = 0
    
    var body: some View {
        Text("\(counter)")
        Image(systemName: "cloud")
            .resizable()
            .scaledToFit()
            .frame(width: 100, height: 100)
            .foregroundColor(Color.white)
        .onReceive(timer) { _ in
           counter += 1
 
        }
    }
}
