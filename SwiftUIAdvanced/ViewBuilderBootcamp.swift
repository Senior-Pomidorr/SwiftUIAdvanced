//
//  ViewBuilderBootcamp.swift
//  SwiftUIAdvanced
//
//  Created by Daniil Kulikovskiy on 4/28/24.
//

import SwiftUI

struct Header: View {
    let title: String
    let description: String?
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.title)
                .fontWeight(.semibold)
            
            if let description = description {
                Text(description)
                    .font(.callout)
            }
            RoundedRectangle(cornerRadius: 5)
                .frame(height: 2)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
    }
}

// Generics type must be confirmed View
struct HeaderViewGeneric<Content:View>: View {
    let title: String
    let content: Content
    
    // Add closure for ViewBuilder
    init(title: String, @ViewBuilder content: () -> Content) {
        self.title = title
        self.content = content()
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.title)
                .fontWeight(.semibold)
            
            content
            
            RoundedRectangle(cornerRadius: 5)
                .frame(height: 2)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
    }
}

struct CUstomStack<Content: View> : View {
    let content: Content
    
    
    // Add closure for ViewBuilder
    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
    
    var body: some View {
        HStack {
            content
        }
    }
}


struct ViewBuilderBootcamp: View {
    var body: some View {
        VStack {
            Header(title: "New ttitle", description: "Hello")
            Header(title: "Another ttitle", description: nil)
            HeaderViewGeneric(title: "Generic title") {
                HStack {
                    Text("Hi")
                    Image(systemName: "heart.fill")
                    Text("Hello!,")
                    Text("Bonjour!")
                }
            }
            LocalViewBuilder(type: .three)
        }
        Spacer()
    }
}

#Preview {
    ViewBuilderBootcamp()
}

struct LocalViewBuilder: View {
    
    enum ViewType {
        case one, two, three
    }
    let type: ViewType
    
    var body: some View {
        VStack {
           headerSection
        }
    }
    
    // Create ViewBuilder
    @ViewBuilder private var headerSection: some View {
        switch type {
        case .one:
            viewOne
        case .two:
            viewTwo
        case .three:
            viewThree
        }
    }
    
    private var viewOne: some View {
        Text("One")
    }
    
    private var viewTwo: some View {
        Text("Two")
    }
    
    private var viewThree: some View {
        HStack {
            Text("Three")
            Image(systemName: "heart.fill")
        }
    }
}
