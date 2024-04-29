//
//  CustomTabBar.swift
//  SwiftUIAdvanced
//
//  Created by Daniil Kulikovskiy on 4/29/24.
//

import SwiftUI

struct AppTabBarView: View {
    
    @State private var selection: String = "home"
    @State private var tabSeletction: TabBarItem = TabBarItem(iconName: "house", title: "House", color: .red)
    
    var body: some View {
        CustomTabBarContainerView(selection: $tabSeletction) {
            Color.blue
                .tabBarItem(tab: TabBarItem(iconName: "house", title: "House", color: .red), selection: $tabSeletction)
            Color.red
                .tabBarItem(tab: TabBarItem(iconName: "heart", title: "Heart", color: .blue), selection: $tabSeletction)
            Color.green
                .tabBarItem(tab: TabBarItem(iconName: "person", title: "Person", color: .green), selection: $tabSeletction)
        }
    }
}


#Preview {
    AppTabBarView()
}

//extension AppTabBarView {
//    private var defaultTabView: some View {
//        TabView(selection: $selection,
//                content:  {
//            Color.red
//                .tabItem {
//                    Image(systemName: "house")
//                    Text("Home")
//                }
//            Color.blue
//                .tabItem {
//                    Image(systemName: "heart")
//                    Text("Favorites")
//                }
//            Color.orange
//                .tabItem {
//                    Image(systemName: "person")
//                    Text("Profile")
//                }
//        })
//    }
//}
