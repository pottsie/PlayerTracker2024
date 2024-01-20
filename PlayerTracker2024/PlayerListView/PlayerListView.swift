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
    @Query(sort: [SortDescriptor(\Player.lastName), SortDescriptor(\Player.firstName)]) private var players: [Player]
    @State private var createNewPlayer = false
    @State private var filter = ""
    
    var body: some View {
        NavigationStack {
            //            PlayerList(filterString: filter)
            Group {
                if players.isEmpty {
                    ContentUnavailableView("Enter your first player", systemImage: "person.fill")
                        .foregroundStyle(Color.black)
                } else {
                    List {
                        ForEach(players) { player in
                            NavigationLink {
                                //                            EditPlayerView(player: player)
                                                            PlayerView(player: player)
//                                UpdatePlayer(player: player)
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
            //                .searchable(text: $filter, prompt: "Search by player name")
            .navigationTitle("Players")
            .sheet(isPresented: $createNewPlayer) {
                NewPlayerView()
                    .presentationDetents([.medium])
            }
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                        // TODO: link to settings view
                    } label: {
                        Image(systemName: "gear")
                    }
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        createNewPlayer.toggle()
                    } label: {
                        Image(systemName: "plus")
                    }
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
