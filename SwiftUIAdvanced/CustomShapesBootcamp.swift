//
//  CustomShapesBootcamp.swift
//  SwiftUIAdvanced
//
//  Created by Daniil Kulikovskiy on 4/26/24.
//

import SwiftUI

struct Triangle: Shape {
    func path(in rect: CGRect) -> Path {
        Path { path in
            path.move(to: CGPoint(x: rect.midX, y: rect.minY))
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
            path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        }
    }
    
    
}

struct CustomShapesBootcamp: View {
    var body: some View {
        ZStack {
            Triangle()
                .stroke(.red)
                .fill(.linearGradient(AnyGradient(Gradient(colors: [.red, .blue])), startPoint: .leading, endPoint: .trailing))
                .frame(width: 300, height: 300)
            
        }
    }
}

#Preview {
    CustomShapesBootcamp()
}
