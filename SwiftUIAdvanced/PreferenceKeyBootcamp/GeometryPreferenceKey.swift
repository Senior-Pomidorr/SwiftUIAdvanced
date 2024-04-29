//
//  GeometryPreferenceKey.swift
//  SwiftUIAdvanced
//
//  Created by Daniil Kulikovskiy on 4/29/24.
//

import SwiftUI

struct GeometryPreferenceKey: View {
    
    @State private var rectSize: CGSize = .zero
    
    var body: some View {
        VStack {
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                .frame(width: rectSize.width, height: rectSize.height)
                .background(.blue)
            
            Spacer()
            HStack {
                Rectangle()
                GeometryReader { geo in
                    Rectangle()
                        .updateRectengleSize(geo.size)
                }
                Rectangle()
            }
            .frame(height: 55)
        }
        .onPreferenceChange(RectangleGeomtryPreferenceKey.self, perform: { value in
            rectSize = value
        })
        .padding()
    }
}

extension View {
    func updateRectengleSize(_ size: CGSize) -> some View {
        preference(key: RectangleGeomtryPreferenceKey.self, value: size)
    }
}

#Preview {
    GeometryPreferenceKey()
}

struct RectangleGeomtryPreferenceKey: PreferenceKey {
    static var defaultValue: CGSize = .zero
    
    static func reduce(value: inout CGSize, nextValue: () -> CGSize) {
        value = nextValue()
    }

    
}
