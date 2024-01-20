//
//  PlayerView.swift
//  PlayerTracker2024
//
//  Created by Michael Potts on 12/30/23.
//

import SwiftUI

struct PlayerView: View {
    var player: Player
    @State private var isEditingPlayer = false
    
    var body: some View {
        NavigationStack {
            VStack {
                PlayerImageView(imageSize: 225, imageData: player.photo)
                    .padding(.vertical)
                
                playerSoccerData()
                
                Divider()
                
                playerPersonalData()
                
                Divider()
                
                // TODO: This section needs to be developed when game data is added ******
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
                // **********************************************************************
                Spacer()
            }
        }
        .navigationTitle(player.fullName)
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button {
                    isEditingPlayer.toggle()
//                    UpdatePlayer(player: player)
                } label: {
                    Text("Edit")
//                    Image(systemName: "pencil")
                }
                .buttonStyle(.borderedProminent)
            }
        }
        .fullScreenCover(isPresented: $isEditingPlayer, content: {
            UpdatePlayer(player: player)
        })
//        .sheet(isPresented: $isEditingPlayer) {
//            UpdatePlayer(player: player)
//        }
    }
    
    func playerSoccerData() -> some View {
        VStack { // player core data
            Text("#\(player.jerseyNumber)")
            Text(player.position)
        }
        .italic()
        .fontWeight(.semibold)
    }
    
    func playerPersonalData() -> some View {
        VStack(alignment: .leading) {
            LabeledContent("Date of Birth:", value: player.dateOfBirth.formatted(date: .long, time: .omitted))
            LabeledContent("Height:", value: "\(player.height) cm")
            LabeledContent("Club:", value: "\(player.club)")
            LabeledContent("High School:", value: "\(player.highSchool)")
            LabeledContent("Phone:", value: "\(player.phone)")
            LabeledContent("Email:", value: "\(player.emailAddress)")
        }
        .padding(.horizontal)
    }
}

#Preview {
    let preview = Preview(Player.self)
    return NavigationStack {
        PlayerView(player: Player.samplePlayers[0])
            .modelContainer(preview.container)
    }
}
