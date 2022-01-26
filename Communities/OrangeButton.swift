//
//  OrangeButton.swift
//  Zumra
//
//  Created by Razan bin rashed on 23/06/1443 AH.
//

import SwiftUI

struct OrangeButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        return configuration.label
            .foregroundColor(.white)
            .background(Color("OrangeColor"))
            .font(.system(size: 20, weight: .regular))
            .cornerRadius(13)
            .scaleEffect(configuration.isPressed ? 0.9 : 1)
            .animation(.easeInOut, value: 0.2)
    }
}
