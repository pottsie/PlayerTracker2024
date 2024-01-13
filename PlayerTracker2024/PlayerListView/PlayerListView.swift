//
//  PlayerListView.swift
//  PlayerTracker2024
//
//  Created by Michael Potts on 12/30/23.
//

import SwiftData
import SwiftUI

struct PlayerListView: View {
//    @Query private var players: [Player]
    @Environment(\.modelContext) private var context
    @Query(sort: [SortDescriptor(\Player.lastName)]) private var players: [Player]
    @State private var createNewPlayer = false
    
    var body: some View {
        NavigationStack {
            Group {
                if players.isEmpty {
                    ContentUnavailableView("Enter your first player", systemImage: "person.fill")
                        .foregroundStyle(Color.orange)
                } else {
                    List {
                        ForEach(players) { player in
                            NavigationLink {
                                PlayerView(player: player)
                            } label: {
                                PlayerListItem(player: player)
                            }
                        }
                        .onDelete { indexSet in
                            indexSet.forEach { index in
                                let player = players[index]
                                context.delete(player)
                            }
                        }
                    }
                    .listStyle(.plain)
                }
            }
            .navigationTitle("Players")
            .sheet(isPresented: $createNewPlayer) {
                NewPlayerView()
                    .presentationDetents([.medium])
            }
            .toolbar {
                Button {
                    createNewPlayer.toggle()
                } label: {
                    Image(systemName: "plus")
                }
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
