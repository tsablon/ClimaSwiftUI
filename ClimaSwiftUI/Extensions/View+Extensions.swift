//
//  View+Extensions.swift
//  ClimaSwiftUI
//
//  Created by Tracy on 17/07/2023.
//

import SwiftUI

extension View {
    func roundedButton(radius: CGFloat = 15, radiusWidth: CGFloat = 3, fontSize: CGFloat = 25) -> some View {
        return self.modifier(RoundedButtonModifier(corner: radius, cornerWidth: radiusWidth, fontSize: fontSize))
    }
}
