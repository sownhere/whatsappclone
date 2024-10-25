//
//  CallsTabScreen.swift
//  TalkTalk
//
//  Created by SownFrenky on 10/23/24.
//

import SwiftUI

struct CallsTabScreen: View {
    
    
    @State private var searchText = ""
    @State private var callHistory = CallHistory.all
    
    var body: some View {
        NavigationStack {
            List {
                Section {
                    CreateCallLinkSection()
                }
                
                Section {
                    ForEach(0..<20) { _ in
                        RecentCallItems()
                    }
                } header: {
                    Text("Recent")
                        .font(.callout)
                        .textCase(.none)
                        .font(.headline)
                        .bold()
                        .foregroundColor(.whatsAppBlack)
                }
            }
            .navigationTitle("Calls")
            .searchable(text: $searchText)
            .toolbar {
                leadingNavItems()
                principalNavItems()
                trailingNavItems()
            }
        }
    }
}

extension CallsTabScreen {
    enum constants {
        static let ImageSize: CGFloat = 45
    }
    
    @ToolbarContentBuilder
    private func leadingNavItems() -> some ToolbarContent {
        ToolbarItem(placement: .topBarLeading) {
            Button("Edit") {
                print("Edit")
            }
        }
    }
    
    @ToolbarContentBuilder
    private func trailingNavItems() -> some ToolbarContent {
        ToolbarItem(placement: .topBarTrailing) {
            Button {
                print("Add")
            } label: {
                Image(systemName: "phone.arrow.up.right")
            }
        }
    }
    
    @ToolbarContentBuilder
    private func principalNavItems() -> some ToolbarContent {
        ToolbarItem(placement: .principal) {
            Picker("Calls", selection: $callHistory) {
                ForEach(CallHistory.allCases, id: \.self) {
                    Text($0.rawValue.capitalized)
                        .tag($0)
                }
            }
            .pickerStyle(.segmented)
            .frame(width: 150)
        }
    }
    
    private enum CallHistory: String, CaseIterable, Identifiable {
        var id: String { rawValue }
        
        case all, missed
    }
}

private struct CreateCallLinkSection: View {
    var body: some View {
        HStack {
            Image(systemName: "link")
                .foregroundColor(.blue)
                .padding(10)
                .background(Color(.systemGray5))
                .clipShape(Circle())
            
            VStack(alignment: .leading) {
                Text("Create Call Link")
                    .font(.headline)
                    .bold()
                    .foregroundColor(.blue)
                
                Text("Share a link for your TalkTalk app call.")
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
        }
    }
}

private struct RecentCallItems: View {
    var body: some View {
        HStack {
            Circle()
                .frame(width: CallsTabScreen.constants.ImageSize, height: CallsTabScreen.constants.ImageSize)
            
            recentCallsTextView()
            
            Spacer()
            
            Text("Yesterday")
                .foregroundColor(Color(.systemGray))
                .font(.system(size: 15))
            
            Image(systemName: "info.circle")
                .foregroundColor(.blue)
        }
    }
    
    private func recentCallsTextView() -> some View {
        VStack(alignment: .leading) {
            Text("Name User?")
//                .font(.callout)
//                .bold()
            
            HStack(spacing: 5) {
                Image(systemName: "phone.arrow.up.right")
                    .foregroundColor(.gray)
                
                Text("Outgoing")
                    .foregroundColor(.gray)
                    .font(.system(size: 15))
            }
        }
    }
}

#Preview {
    CallsTabScreen()
}
