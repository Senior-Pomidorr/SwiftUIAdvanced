//
//  ViewModifierBootcamp.swift
//  SwiftUIAdvanced
//
//  Created by Daniil Kulikovskiy on 4/21/24.
//

import SwiftUI


// Create custom modifier
struct DefaultButtonViewModifier: ViewModifier {
    
    let backgroundColor: Color
    
    func body(content: Content) -> some View {
        content
            .foregroundStyle(.white)
            .frame(height: 55)
            .frame(maxWidth: .infinity)
            .background(backgroundColor)
            .clipShape(.rect(cornerRadius: 10))
            .shadow(radius: 10)
    }
}

// Add extension for use this modifier
extension View {
    func defaultButton(backgroundColor: Color = .blue) -> some View {
        modifier(DefaultButtonViewModifier(backgroundColor: backgroundColor))
    }
}

struct ViewModifierBootcamp: View {
    
    var body: some View {
        VStack(spacing: 19) {
            Text("Hello world!")
                .font(.headline)
                .modifier(DefaultButtonViewModifier(backgroundColor: .blue))
            Text("Hello User!")
                .font(.subheadline)
                .defaultButton(backgroundColor: .red)
        }
        .padding()
    }
}

#Preview {
    ViewModifierBootcamp()
}
