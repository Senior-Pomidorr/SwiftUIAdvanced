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
            Packman(cornedRadius: animate ? 20 : 0)
                .frame(width: 260, height: 250)
                .foregroundColor(.yellow)
        }
        .onAppear {
            withAnimation(Animation.easeInOut.repeatForever()) {
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
                startAngle: Angle(degrees: cornedRadius),
                endAngle: Angle(degrees: 360 - cornedRadius),
                clockwise: false
            )
            
            path.addLine(to: CGPoint(x: rect.maxX - cornedRadius, y: rect.maxY))
            path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
            
        }
    }
}

struct Packman: Shape {
    
    var cornedRadius: Double
    var animatableData: Double {
        get {
            cornedRadius
        }
        set {
            cornedRadius = newValue
        }
    }
    
    func path(in rect: CGRect) -> Path {
        Path { path in
            path.move(to: CGPoint(x: rect.midX, y: rect.minY))
            path.addArc(
                center: CGPoint(x: rect.midX, y: rect.minY),
                radius: rect.height / 2,
                startAngle: Angle(degrees: cornedRadius),
                endAngle: Angle(degrees: 360 - cornedRadius),
                clockwise: false
            )
        }
    }
}
