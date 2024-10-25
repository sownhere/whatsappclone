//
//  ContentView.swift
//  TalkTalk
//
//  Created by SownFrenky on 10/21/24.
//

import SwiftUI

struct MainTabView: View {
    
    
    init() {
        makeTabBarOpaque()
    }
    
    
    var body: some View {
        TabView {
            
            UpdatesTabScreen()
                .tabItem {
                    Label("Update", systemImage: Tab.updates.icon)
                }
                .tag(Tab.updates.title)
            
            CallsTabScreen()
                .tabItem {
                    Label("Calls", systemImage: Tab.calls.icon)
                }
                .tag(Tab.calls.title)
            
            CommunityTabScreen()
                .tabItem {
                    Label("Communities", systemImage: Tab.communities.icon)
                }
                .tag(Tab.communities.title)
            
            Text("Chats")
                .tabItem {
                    Label("Chats", systemImage: Tab.chats.icon)
                }
                .tag(Tab.chats.title)
            
            Text("Settings")
                .tabItem {
                    Label("Settings", systemImage: Tab.settings.icon)
                }
                .tag(Tab.settings.title)
            
        }
    }
}

extension MainTabView {
    private enum Tab: String {
        case updates, calls, communities, chats, settings
        
        
        fileprivate var title: String {
            return rawValue.capitalized
        }
        
        fileprivate var icon: String {
            switch self {
            case .updates:
                return "circle.dashed.inset.filled"
            case .calls:
                return "phone"
            case .communities:
                return "person.3"
            case .chats:
                return "message"
            case .settings:
                return "gear"
            }
        }
        
    }
    
    private func makeTabBarOpaque() {
        let appearance = UITabBarAppearance()
        appearance.configureWithOpaqueBackground()
        UITabBar.appearance().standardAppearance = appearance
        UITabBar.appearance().scrollEdgeAppearance = appearance
    }
    
}

#Preview {
    MainTabView()
}
