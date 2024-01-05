//
//  PlayerListView.swift
//  PlayerTracker2024
//
//  Created by Michael Potts on 12/30/23.
//

import SwiftData
import SwiftUI

struct PlayerListView: View {
    @Query private var players: [Player]
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(players) { player in
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
            .listStyle(.plain)
        }
        .navigationTitle("Players")
        .toolbar {
            Button {
                
            } label: {
                Image(systemName: "plus")
            }
        }
    }
}

#Preview {
    let preview = Preview(Player.self)
    preview.addExamples(Player.samplePlayers)
    return NavigationStack {
        PlayerListView()
            .modelContainer(preview.container)
    }
}
