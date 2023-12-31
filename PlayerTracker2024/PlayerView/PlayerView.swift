//
//  PlayerView.swift
//  PlayerTracker2024
//
//  Created by Michael Potts on 12/30/23.
//

import SwiftUI

struct PlayerView: View {
    var player: Player
    
    var body: some View {
        NavigationStack {
            VStack {
                PlayerImageView(imageSize: 200, imageData: player.photo)
                    .padding(.vertical)
                
                Group { // player core data
                    Text("#\(player.jerseyNumber)")
                    Text(player.position)
                    Text("\(player.height) cm")
                }
                .italic()
                .fontWeight(.semibold)
                
                Divider()
                
                VStack(alignment: .leading) {
                    LabeledContent("Date of Birth:", value: "January 5, 2007")
                    LabeledContent("Height:", value: "\(player.height) cm")
                    LabeledContent("Club:", value: "\(player.club)")
                    LabeledContent("High School:", value: "\(player.highSchool)")
                    LabeledContent("Phone:", value: "571-255-0187")
                    LabeledContent("Email:", value: "nfl_noah@icloud.com")
                }
                .padding(.horizontal)
                
                Divider()
                
                VStack(alignment: .leading) { // key stat summary; goals, assists, pass completion
                    LabeledContent("Goals:", value: "3")
                    LabeledContent("Assists:", value: "5")
                    LabeledContent("Shots on Goal:", value: "12")
                    LabeledContent("Pass Completion:", value: "75.3%")
                }
                .padding(.horizontal)
                
                Divider()
                
                Button {
                    
                } label: {
                    Text("5 Games Tracked")
                }
                .buttonStyle(.borderedProminent)
                
                Spacer()
            }
        }
        .navigationTitle(player.fullName)
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    let preview = Preview(Player.self)
    return NavigationStack {
        PlayerView(player: Player.samplePlayers[0])
            .modelContainer(preview.container)
    }
}
