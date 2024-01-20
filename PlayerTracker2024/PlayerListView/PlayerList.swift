//
//  PlayerList.swift
//  PlayerTracker2024
//
//  Created by Michael Potts on 1/16/24.
//

import SwiftData
import SwiftUI

struct PlayerList: View {
    @Environment(\.modelContext) private var context
    @Query private var players: [Player]
    init(filterString: String) {
        let predicate = #Predicate<Player> { player in
            player.firstName.localizedStandardContains(filterString)
            || player.lastName.localizedStandardContains(filterString)
            || filterString.isEmpty
        }
        _players = Query(filter: predicate, sort: [SortDescriptor(\Player.lastName), SortDescriptor(\Player.firstName)])
    }
    
    var body: some View {
        Group {
            if players.isEmpty {
                ContentUnavailableView("Enter your first player", systemImage: "person.fill")
                    .foregroundStyle(Color.black)
            } else {
                List {
                    ForEach(players) { player in
                        NavigationLink {
//                            EditPlayerView(player: player)
//                            PlayerView(player: player)
                            UpdatePlayer(player: player)
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
    }
}

#Preview {
    let preview = Preview(Player.self)
    preview.addExamples(Player.samplePlayers)
    return NavigationStack {PlayerList(filterString: "")
            .modelContainer(preview.container)
    }
}
