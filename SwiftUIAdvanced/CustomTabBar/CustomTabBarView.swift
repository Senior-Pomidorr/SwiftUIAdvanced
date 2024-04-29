//
//  CustomTabBarView.swift
//  SwiftUIAdvanced
//
//  Created by Daniil Kulikovskiy on 4/29/24.
//

import SwiftUI

struct CustomTabBarView: View {
    
    let tabs: [TabBarItem]
    @Binding var selection: TabBarItem
    
    var body: some View {
        HStack {
            ForEach(tabs, id: \.self) { tab in
                tabView(tab: tab)
                    .onTapGesture {
                        switchToTab(tab: tab)
                    }
            }
        }
        .padding(6)
        .background(Color.white.ignoresSafeArea(edges: .bottom))
    }
}

#Preview {
    VStack {
        Spacer()
        CustomTabBarView(tabs: TabBarItem.previewTabs, selection: .constant(TabBarItem.previewTabs.first!))
    }
}

extension CustomTabBarView {
    
    private func tabView(tab: TabBarItem) -> some View {
        VStack {
            Image(systemName: tab.iconName)
                .font(.subheadline)
            Text(tab.title)
                .font(.system(size: 10, weight: .semibold, design: .rounded))
            
        }
        .foregroundStyle(selection == tab ? tab.color : Color.gray)
        .padding(.vertical, 8)
        .frame(maxWidth: .infinity)
        .background(selection == tab ? tab.color.opacity(0.2) : Color.clear)
        .clipShape(.rect(cornerRadius: 10))
    }
    
    private func switchToTab(tab: TabBarItem) {
        withAnimation {
            selection = tab
        }
    }
}

struct TabBarItem: Hashable {
    let iconName: String
    let title: String
    let color: Color
    
    static let previewTabs: [TabBarItem] = [
           TabBarItem(iconName: "house", title: "House", color: .red),
           TabBarItem(iconName: "heart", title: "Heart", color: .blue),
           TabBarItem(iconName: "person", title: "Person", color: .green)
       ]
}
