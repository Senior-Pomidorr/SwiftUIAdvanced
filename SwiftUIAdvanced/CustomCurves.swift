//
//  CustomCurves.swift
//  SwiftUIAdvanced
//
//  Created by Daniil Kulikovskiy on 4/26/24.
//

import SwiftUI

struct CustomCurves: View {
    var body: some View {
        ZStack {
            waterShape()
                .fill(
                    LinearGradient(colors: [.red, .blue], startPoint: .topLeading, endPoint: .bottomTrailing)
                )
                .ignoresSafeArea()
                .background(
                    .linearGradient(colors: [.red, .orange], startPoint: .topTrailing, endPoint: .bottomLeading)
                )
        
            Text("ONE WAY")
                .font(.title)
                .bold()
                .foregroundStyle(.white)
        }
    }
}

#Preview {
    CustomCurves()
}

struct sampleArc: Shape {
    func path(in rect: CGRect) -> Path {
        Path { path in
            path.move(to: CGPoint(x: rect.midX, y: rect.midY - 60))
            path.addArc(
                center: CGPoint(x: rect.midX, y: rect.midY ),
                radius: rect.height / 2,
                startAngle: Angle(degrees: -20),
                endAngle: Angle(degrees: 20),
                clockwise: true
            )
        }
    }
}

struct shapeWithArc: Shape {
    func path(in rect: CGRect) -> Path {
        Path { path in
            // top left
            path.move(to: CGPoint(x: rect.minX, y: rect.minY))
            
            // top right
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.minY))
            
            // mid right
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.midY))
            
            //            // bottom
            path.addArc(
                center: CGPoint(x: rect.midX, y: rect.midY),
                radius: rect.height / 2,
                startAngle: Angle(degrees: 0),
                endAngle: Angle(degrees: 180),
                clockwise: false
            )
            //            path.addLine(to: CGPoint(x: rect.midX, y: rect.maxY))
            
            // mid left
            path.addLine(to: CGPoint(x: rect.minX, y: rect.midY))
            
            // top left
            path.addLine(to: CGPoint(x: rect.minX, y: rect.minY))
            
        }
    }
}


struct quickSample: Shape {
    func path(in rect: CGRect) -> Path {
        Path { path in
            path.move(to: .zero)
            path.addQuadCurve(
                to: CGPoint(x: rect.midX, y: rect.midY),
                control: CGPoint(x: rect.maxX - 50, y: rect.minY - 100)
            )
        }
    }
}

struct waterShape: Shape {
    func path(in rect: CGRect) -> Path {
        Path { path in
            path.move(to: CGPoint(x: rect.minX, y: rect.midX))
            path.addQuadCurve(
                to: CGPoint(x: rect.midX, y: rect.midY + 20),
                control: CGPoint(x: rect.width * 0.30, y: rect.height * 0.30)
            )
            
            path.addQuadCurve(
                to: CGPoint(x: rect.maxX, y: rect.midY + 20),
                control: CGPoint(x: rect.width * 0.70, y: rect.height * 0.70)
            )
            
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
            path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        }
    }
}
