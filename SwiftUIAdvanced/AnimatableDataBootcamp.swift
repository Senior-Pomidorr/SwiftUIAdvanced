//
//  AnimatableDataBootcamp.swift
//  SwiftUIAdvanced
//
//  Created by Daniil Kulikovskiy on 4/27/24.
//

import SwiftUI

struct AnimatableDataBootcamp: View {
    @State private var animate: Bool = false
    var body: some View {
        ZStack {
//            RoundedRectangle(cornerRadius: animate ? 30 : 0)
            RectangleSingleCorener(cornedRadius: animate ? 60 : 0)
                .frame(width: 260, height: 250)
        }
        .onAppear {
            withAnimation(Animation.linear(duration: 2.0).repeatForever()) {
                animate.toggle()
            }
        }
    }
}

#Preview {
    AnimatableDataBootcamp()
}

struct RectangleSingleCorener: Shape {
    
    var cornedRadius: CGFloat
    
    var animatableData: CGFloat {
        get { cornedRadius }
        set { cornedRadius = newValue }
    }
    
    func path(in rect: CGRect) -> Path {
        Path { path in
            path.move(to: .zero)
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.minY))
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY - cornedRadius))
            
            path.addArc(
                center: CGPoint(x: rect.maxX - cornedRadius, y: rect.maxY - cornedRadius),
                radius: cornedRadius,
                startAngle: Angle(degrees: 0),
                endAngle: Angle(degrees: 360),
                clockwise: false
            )
            
            path.addLine(to: CGPoint(x: rect.maxX - cornedRadius, y: rect.maxY))
            path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
            
        }
    }
}
