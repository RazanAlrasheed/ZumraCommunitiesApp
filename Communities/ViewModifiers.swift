//
//  ViewModifiers.swift
//  B8050
//
//  Created by Buthaina Albassam on 25/01/22.
//

import Foundation
import SwiftUI

/// Text style with app accent color
///
struct DefaultTextFieldStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding()
            .font(.system(size: 17))
            .frame(height: 58)
            .disableAutocorrection(true)
            .autocapitalization(.none)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(.secondary, lineWidth: 1)
            )
            .padding([.leading, .trailing], 16)
    }
}

// MARK: View extensions
extension View {
    func defaultTextStyle() -> some View {
        self.modifier(DefaultTextFieldStyle())
    }
}
