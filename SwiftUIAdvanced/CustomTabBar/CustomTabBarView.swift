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
    @Namespace private var nameSpace
    @State var localSelection: TabBarItem
    var body: some View {
        tabBarVersionTwo
            .onChange(of: selection) { value in
                withAnimation(.easeInOut) {
                    localSelection = value
                }
            }
    }
}

#Preview {
    VStack {
        Spacer()
        CustomTabBarView(tabs: TabBarItem.previewTabs, selection: .constant(TabBarItem.previewTabs.first!), localSelection: TabBarItem.previewTabs.first!)
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
    
    private var tabBarVersionOne: some View {
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
    
    private func switchToTab(tab: TabBarItem) {
//        withAnimation {
            selection = tab
//        }
    }
}

extension CustomTabBarView {
    private func tabViewTwo(tab: TabBarItem) -> some View {
        VStack {
            Image(systemName: tab.iconName)
                .font(.subheadline)
            Text(tab.title)
                .font(.system(size: 10, weight: .semibold, design: .rounded))
            
        }
        .foregroundStyle(localSelection == tab ? tab.color : Color.gray)
        .padding(.vertical, 8)
        .frame(maxWidth: .infinity)
        .background(
            ZStack {
                if localSelection == tab {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(tab.color.opacity(0.2))
                        // Slow animated tabs
                        .matchedGeometryEffect(id: "background_rectangle", in: nameSpace)
                }
            }
        )
    }
    
    private var tabBarVersionTwo: some View {
        HStack {
            ForEach(tabs, id: \.self) { tab in
                tabViewTwo(tab: tab)
                    .onTapGesture {
                        switchToTab(tab: tab)
                    }
            }
        }
        .padding(6)
        .background(Color.white.ignoresSafeArea(edges: .bottom))
        .clipShape(.rect(cornerRadius: 10))
        .shadow(color: Color.black.opacity(0.3), radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/, x: 0, y: 10)
        .padding(.horizontal)
    }
}
