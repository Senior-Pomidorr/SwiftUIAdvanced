//
//  TabBarModel.swift
//  SwiftUIAdvanced
//
//  Created by Daniil Kulikovskiy on 4/30/24.
//

import Foundation
import SwiftUI

enum TabBarItem: Hashable {
    case home, favorites, profile, messages
    
    var iconName: String {
        switch self {
        case .home:
            "house"
        case .favorites:
            "heart"
        case .profile:
            "person"
        case .messages:
            "message"
        }
    }
    
    var title: String {
        switch self {
        case .home:
            "House"
        case .favorites:
            "Favorites"
        case .profile:
            "Profile"
        case .messages:
            "Message"
        }
    }
    
    var color: Color {
        switch self {
        case .home:
                .red
        case .favorites:
                .blue
        case .profile:
                .green
        case .messages:
                .cyan
        }
    }
    
    // Preview mock data
    static let previewTabs: [TabBarItem] = [
        .home, .favorites, .profile, .messages
       ]
}
