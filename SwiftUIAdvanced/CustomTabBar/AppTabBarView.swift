//
//  CustomTabBar.swift
//  SwiftUIAdvanced
//
//  Created by Daniil Kulikovskiy on 4/29/24.
//

import SwiftUI

struct AppTabBarView: View {
    
    @State private var selection: String = "home"
    @State private var tabSeletction: TabBarItem = .home
    
    var body: some View {
        CustomTabBarContainerView(selection: $tabSeletction) {
            Color.blue
                .tabBarItem(tab: .home, selection: $tabSeletction)
            Color.red
                .tabBarItem(tab: .favorites, selection: $tabSeletction)
            Color.orange
                .tabBarItem(tab: .messages, selection: $tabSeletction)
            Color.green
                .tabBarItem(tab: .profile, selection: $tabSeletction)
        }
    }
}


#Preview {
    AppTabBarView()
}

extension AppTabBarView {
    private var defaultTabView: some View {
        TabView(selection: $selection,
                content:  {
            Color.red
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }
            Color.blue
                .tabItem {
                    Image(systemName: "heart")
                    Text("Favorites")
                }
            Color.orange
                .tabItem {
                    Image(systemName: "person")
                    Text("Profile")
                }
        })
    }
}
