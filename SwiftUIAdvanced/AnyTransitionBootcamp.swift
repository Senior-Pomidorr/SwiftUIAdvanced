//
//  AnyTransitionBootcamp.swift
//  SwiftUIAdvanced
//
//  Created by Daniil Kulikovskiy on 4/21/24.
//

import SwiftUI


struct RotateViewModifier: ViewModifier {
    
    let rotation: Double
    
    func body(content: Content) -> some View {
        content
            .rotationEffect(Angle(degrees: rotation))
            // Rotate out of screen
            .offset(x: rotation != 0 ? UIScreen.main.bounds.width : 0,
                    y: rotation != 0 ? UIScreen.main.bounds.height : 0)
    }
}

extension AnyTransition {
    static var rotating: AnyTransition {
        modifier(
            active: RotateViewModifier(rotation: 1080),
            identity: RotateViewModifier(rotation: 0))
    }
    
    // add custom func for rotation
    static func rotating(rotatimg: Double) -> AnyTransition {
        modifier(
            active: RotateViewModifier(rotation: rotatimg),
            identity: RotateViewModifier(rotation: 0))
    }
    
    // add asymmetric transition
    static var rotateOn: AnyTransition {
        asymmetric(insertion: .rotating,
                   removal: .move(edge: .leading))
    }
}


struct AnyTransitionBootcamp: View {
    @State private var showRectangle: Bool = false
    
    var body: some View {
        VStack {
            Spacer()
            
            if showRectangle {
                RoundedRectangle(cornerRadius: 25)
                    .frame(width: 250, height: 350)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .transition(.rotateOn)
            }
            
            Spacer()
            Text("Click me")
                .defaultButton()
                .padding()
                .onTapGesture {
                    withAnimation(.easeInOut(duration: 0.5)) {
                        showRectangle.toggle()
                    }
                }
        }
    }
}

#Preview {
    AnyTransitionBootcamp()
}
