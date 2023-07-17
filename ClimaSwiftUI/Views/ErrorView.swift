//
//  ErrorView.swift
//  ClimaSwiftUI
//
//  Created by Tracy on 17/07/2023.
//

import SwiftUI

struct ErrorView: View {
    
    var body: some View {
        
        VStack {
            Spacer()
            Text("Une erreur est survenue")
                .font(.system(size: 18))
                .foregroundColor(Color.white)
            Spacer()
            ResetView()
        }
        .frame(
            minWidth: 0,
            maxWidth: .infinity,
            minHeight: 0,
            maxHeight: .infinity
        )
    }
}
