//
//  PlayerListItem.swift
//  PlayerTracker2024
//
//  Created by Michael Potts on 1/12/24.
//

import SwiftUI

struct PlayerListItem: View {
    let player: Player
    
    var body: some View {
        HStack {
            PlayerImageView(imageSize: 70, imageData: player.photo)
            
            VStack(alignment: .leading) {
                Text(player.fullName)
                    .font(.title2)
                    .fontWeight(.semibold)
                Text(player.position)
                    .italic()
            }
        }
    }
}

#Preview {
    let preview = Preview(Player.self)
    return PlayerListItem(player: Player.samplePlayers[0])
        .modelContainer(preview.container)
}
