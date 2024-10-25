//
//  CommunityTabScreen.swift
//  TalkTalk
//
//  Created by SownFrenky on 10/25/24.
//

import SwiftUI

struct CommunityTabScreen: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 10) {
                    Image(.communities)
                    
                    Group {
                        Text("Stay connected with a community")
                            .font(.title2)
                        
                        Text("Communities bring members together in topic-based groups. Any community you're added to will appear here.")
                            .foregroundStyle(.gray)
                    }
                    .padding(.horizontal, 5)
                    
                    Button {
                        print("Example Communities")
                    } label: {
                        Text("See example communities.")
                            .bold().underline(true, color: .blue)
                    }
                    .frame(maxWidth: .infinity, alignment: .center)
                    .foregroundStyle(.whatsAppBlack)
                    
                    createNewCommunityButton()
                }
            }
            .navigationTitle("Communities")
            .padding()
        }
    }
    
    private func createNewCommunityButton() -> some View {
        Button {
            print("Create Communities")
        } label: {
            Label("New Community.", systemImage: "plus")
                .frame(maxWidth: .infinity, alignment: .center)
                .padding(10)
                .foregroundStyle(.white)
                .background(.blue)
                .clipShape(Capsule())
                .padding()
                .bold()
        }
    }
    
}

#Preview {
    CommunityTabScreen()
}
