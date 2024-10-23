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
                StatusSectionHeader()
                    .listRowBackground(Color(.clear))
                
                StatusSection()
            }
            .listStyle(.grouped)
            .navigationTitle("Updates")
            .searchable(text: $searchText)
            
        }
    }
}

private struct StatusSectionHeader: View {
    var body: some View {
        HStack(alignment: .top) {
            Image(systemName: "circle.dashed")
                .foregroundColor(.blue)
                .imageScale(.large)
            
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
    }
}

private struct StatusSection: View {
    var body: some View {
        HStack {
            Circle()
                .frame(width: 50, height: 50)
            
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

#Preview {
    UpdatesTabScreen()
}
