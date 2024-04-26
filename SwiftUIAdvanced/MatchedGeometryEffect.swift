//
//  MatchedGeometryEffect.swift
//  SwiftUIAdvanced
//
//  Created by Daniil Kulikovskiy on 4/22/24.
//

import SwiftUI

struct MatchedGeometryEffect: View {
    
    @State private var isClicked: Bool = false
    @Namespace private var namespaces
    
    let categories: [String] = ["Hone", "Popular", "Saved"]
    @State private var selectedTabs: String = ""
    @Namespace private var newNameSpaces
    
    var body: some View {
        VStack {
            if !isClicked {
                Circle()
                    .matchedGeometryEffect(id: "rectangle", in: namespaces)
                    .frame(width: 100, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
            }
            Spacer()
            HStack {
                ForEach(categories, id: \.self) { category in
                    ZStack(alignment: .bottom) {
                        if selectedTabs == category {
                            RoundedRectangle(cornerRadius: 10)
                                .fill(.red)
                                .matchedGeometryEffect(id: "categoryBackground", in: newNameSpaces)
                                .frame(width: 35, height: 2)
                                .offset(y: 10)
                        }
                            Text(category)
                            .foregroundStyle(selectedTabs == category ? .red : .black)
                        }
                    
                    .frame(maxWidth: .infinity)
                    .frame(height: 55)
                    .onTapGesture {
                        withAnimation(.easeInOut) {
                            selectedTabs = category
                        }
                    }
                }
            }
            
            if isClicked {
                Circle()
                    .matchedGeometryEffect(id: "rectangle", in: namespaces)
                    .frame(width: 300, height: 200)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .onTapGesture {
            withAnimation(.easeInOut) {
                isClicked.toggle()
                print(isClicked)
            }
        }
    }
}

#Preview {
    MatchedGeometryEffect()
}

