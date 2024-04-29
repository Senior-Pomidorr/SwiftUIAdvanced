//
//  CustomTabBarContainerView.swift
//  SwiftUIAdvanced
//
//  Created by Daniil Kulikovskiy on 4/29/24.
//

import SwiftUI

struct CustomTabBarContainerView<Content: View> : View {
    
    @Binding var selection: TabBarItem
    let content: Content
    @State private var tabs: [TabBarItem] = []
    
    init(selection: Binding<TabBarItem>, @ViewBuilder content: () -> Content) {
        self._selection = selection
        self.content = content()
    }
    
    var body: some View {
        VStack(spacing: .zero){
            ZStack {
                content
            }
            CustomTabBarView(tabs: tabs, selection: $selection)
        }
        .onPreferenceChange(TabBarItemsPreferenceKeys.self, perform: { value in
            self.tabs = value
        })
    }
}

#Preview {
    CustomTabBarContainerView(selection: .constant(TabBarItem.previewTabs.first!)) {
        Color.red
    }
}
