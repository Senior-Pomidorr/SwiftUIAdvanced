//
//  ButtonStyle.swift
//  SwiftUIAdvanced
//
//  Created by Daniil Kulikovskiy on 4/21/24.
//

import SwiftUI

// Add button style
struct ButtonPressableStyle: ButtonStyle {
    let scaleAmount: CGFloat
    
    init(scaleAmount: CGFloat = 0.9) {
        self.scaleAmount = scaleAmount
    }
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed ? scaleAmount : 1.0)
            .opacity(configuration.isPressed ? 0.9 : 1.0)
    }
}

// Add extension for use this modifier
extension View {
    func withPressableStyle(scaleAmount: CGFloat = 0.9) -> some View {
        buttonStyle(ButtonPressableStyle(scaleAmount: scaleAmount))
    }
}


struct ButtonStyleBootcamp: View {
    var body: some View {
        Button(action: {
            
        }, label: {
            Text("Click me")
                .font(.headline)
                .defaultButton()
        })
//        .buttonStyle(ButtonPressableStyle(scaleAmount: 0.9))
        .withPressableStyle(scaleAmount: 1.2)
        .padding(40)
    }
}

#Preview {
    ButtonStyleBootcamp()
}
