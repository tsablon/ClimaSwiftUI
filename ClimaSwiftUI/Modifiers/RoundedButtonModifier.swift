//
//  RoundedButton.swift
//  ClimaSwiftUI
//
//  Created by Tracy on 17/07/2023.
//

import SwiftUI

struct RoundedButtonModifier: ViewModifier {
    let corner: CGFloat
    let cornerWidth: CGFloat
    let fontSize: CGFloat
    
    func body(content: Content) -> some View {
        content
            .padding(.all)
            .foregroundColor(.white)
            .font(.system(size: fontSize, weight: .regular))
            .overlay(
                RoundedRectangle(cornerRadius: corner)
                    .stroke(Color.white, lineWidth: cornerWidth)
            )
    }
}
