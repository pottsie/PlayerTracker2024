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
                Circle()
                    .frame(width: 250)
                
                Group { // player core data
                    Text("Jersey number")
                    Text("Position")
                    Text("Height")
                    Text("Date of Birth")
                }
                
                Divider()
                
                Group { // key stat summary; goals, assists, pass completion
                    Text("Summary Stats")
                }
                
                Divider()
                
                Text("Game info") // number of games played, link to game list
                
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
