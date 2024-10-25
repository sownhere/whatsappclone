//
//  UpdatesTabView.swift
//  TalkTalk
//
//  Created by SownFrenky on 10/22/24.
//

import SwiftUI

struct UpdatesTabScreen: View {
    
    @State private var searchText = ""
    
    var body: some View {
        NavigationStack {
            List {
                Section {
                    StatusSection()
                    
                    
                } header: {
                        StatusSectionHeader()
                            .padding(.bottom, 10)
                }
                
                Section {
                    RecentUpdatesSection()
                } header: {
                    Text("Recent Updates")
                        .font(.callout).bold()
//                        .foregroundColor(.whatsAppBlack)
                }
                
                Section {
                    ChannelListView()
                } header: {
                    ChannelSectionHeader()
                }

            }
            .navigationTitle("Updates")
            .searchable(text: $searchText)
            
        }
    }
}

extension UpdatesTabScreen {
    enum constants {
        static let ImageSize: CGFloat = 55
    }
}

private struct StatusSectionHeader: View {
    var body: some View {
        VStack {

            Text("Status")
//                .font(.title3).bold()
//                .padding(5)
                .frame(maxWidth: .infinity, alignment: .leading)
//                .foregroundColor(.whatsAppBlack)
//                .textCase(.none)
                .font(.callout).bold()
            
            HStack(alignment: .top) {
                Image(systemName: "circle.dashed")
                    .foregroundColor(.blue)
                    .imageScale(.large)
                    .onTapGesture {
                        // delete HStack
                        
                    }
                
                (
                    Text("Use Status to share photos, text and videos that disapprear in 24 hours.")
                    
                    +
                    
                    Text(" ")
                    
                    +
                    
                    Text("Status Privacy")
                        .foregroundColor(.blue).bold()
                )
                
                Image(systemName: "xmark")
                    .foregroundColor(.gray)
            }
            .padding()
            .background(.whatsAppWhite)
            .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
        }
    }
}

private struct StatusSection: View {
    var body: some View {
        HStack {
            Circle()
                .frame(width: UpdatesTabScreen.constants.ImageSize, height: UpdatesTabScreen.constants.ImageSize)
            
            VStack(alignment: .leading) {
                Text("My Status")
                    .font(.callout)
                    .bold()
                
                Text("Add to my status.")
                    .foregroundColor(.gray)
                    .font(.system(size: 15))
            }
            
            Spacer()
            
            cameraButton()
            editButton()
        }
    }
    
    private func cameraButton() -> some View {
        Button {
            
        } label: {
            Image(systemName: "camera.fill")
                .padding(10)
                .background(Color(.systemGray5))
                .clipShape(Circle())
                .bold()
        }
    }
    
    private func editButton() -> some View {
        Button {
            
        } label: {
            Image(systemName: "pencil")
                .padding(10)
                .background(Color(.systemGray5))
                .clipShape(Circle())
                .bold()
        }
    }
}

private struct RecentUpdatesSection: View {
    var body: some View {
        HStack {
            Circle()
                .frame(width: UpdatesTabScreen.constants.ImageSize, height: UpdatesTabScreen.constants.ImageSize)
            
            VStack(alignment: .leading) {
                Text("Name User?")
                    .font(.callout)
                    .bold()
                
                Text("Time?")
                    .foregroundColor(.gray)
                    .font(.system(size: 15))
            }
        }
    }
}

private struct ChannelListView: View {
    var body: some View {
        VStack(alignment: .leading) {
            
            Text("Stay updated on  topics that matter to you. Find channels to follow below.")
                .font(.callout)
                .foregroundColor(.gray)
                .padding(.horizontal)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(0..<5) { _ in
                        ChannelItemView()
                        
                    }
                }
            }
            
            Button("Explore more")
            {
                
            }
            .tint(.blue)
            .bold()
            .buttonStyle(.borderedProminent)
            .clipShape(Capsule())
            .padding(.vertical)
        }
    }
    
}

private struct ChannelItemView: View {
    var body: some View {
        VStack {
            Circle()
                .frame(width: UpdatesTabScreen.constants.ImageSize, height: UpdatesTabScreen.constants.ImageSize)
            
            Text("Real Madrid C.F")
                .font(.callout)
                .bold()
                .padding(5)
            
            Button {
                
            } label: {
                Text("Follow")
                    .frame(maxWidth: .infinity)
                    .foregroundColor(.blue)
                    .padding(5)
                    .background(Color.blue.opacity(0.2))
                    .clipShape(Capsule())
            }
        }
        .padding(.horizontal, 10)
        .padding(.vertical)
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color.gray.opacity(0.2), lineWidth: 1)
        )
    }
}

private struct ChannelSectionHeader: View {
    var body: some View {
        HStack {
            Text("Channels")
//                .font(.title3)
//                .bold()
//                .foregroundColor(.whatsAppBlack)
//                .textCase(.none)
                .font(.callout).bold()
            
            Spacer()
            
            Button {
                
            } label: {
                Image(systemName: "plus")
                    .padding(5)
                    .background(Color(.systemGray5))
                    .clipShape(Circle())
            }
        }
    }
}

#Preview {
    UpdatesTabScreen()
}
