//
//  GameListView.swift
//  PlayerTracker2024
//
//  Created by Michael Potts on 2/1/24.
//

import SwiftUI

struct GameListView: View {
    @Environment(\.modelContext) private var modelContext
    let player: Player
    @State private var opponent = ""
    @State private var opponentScore = 0
    @State private var ourScore = 0
    @State private var goals = 0
    @State private var assists = 0
    @State private var selectedGame: Game?
    var isEditing: Bool {
        selectedGame != nil
    }
    
    var body: some View {
        GroupBox {
            VStack {
                LabeledContent("Opponent") {
                    TextField("opponent name", text: $opponent)
                        .autocorrectionDisabled()
                    
                }
                LabeledContent("Opponent's score") {
                    TextField("", value: $opponentScore, format: .number)
                        .frame(width: 50)
                    Spacer()
                }
                LabeledContent("Our score") {
                    TextField("", value: $ourScore, format: .number)
                        .frame(width: 50)
                    Spacer()
                }
                LabeledContent("Goals") {
                    TextField("", value: $goals, format: .number)
                        .frame(width: 50)
                    Spacer()
                }
                LabeledContent("Assists") {
                    TextField("", value: $assists, format: .number)
                        .frame(width: 50)
                    Spacer()
                }
                HStack {
                    if isEditing {
                        Button("Cancel") {
                            opponent = ""
                            opponentScore = 0
                            ourScore = 0
                            goals = 0
                            assists = 0
                            selectedGame = nil
                        }
                        .buttonStyle(.borderedProminent)
                    }
                    Spacer()
                    Button(isEditing ? "Update" : "Create") {
                        if isEditing {
                            selectedGame?.opponent = opponent
                            selectedGame?.opponentScore = opponentScore
                            selectedGame?.ourScore = ourScore
                            selectedGame?.goals = goals
                            selectedGame?.assists = assists
                            opponent = ""
                            opponentScore = 0
                            ourScore = 0
                            goals = 0
                            assists = 0
                            selectedGame = nil
                        } else {
                            let game = Game(opponent: opponent, opponentScore: opponentScore, ourScore: ourScore, dateOfGame: Date.now, goals: goals, assists: assists)
                            player.gamesPlayed?.append(game)
                            opponent = ""
                            opponentScore = 0
                            ourScore = 0
                            goals = 0
                            assists = 0
                        }
                    }
                    .buttonStyle(.borderedProminent)
                    .disabled(opponent.isEmpty)
                }
            }
            .textFieldStyle(.roundedBorder)
            
        }
        .padding(.horizontal)
        List {
            let sortedGames = player.gamesPlayed ?? []
            ForEach(sortedGames) { game in
                HStack {
                    VStack(alignment: .leading) {
                        Text(game.dateOfGame, format: .dateTime.month().day().year())
                            .font(.caption)
                            .foregroundStyle(.secondary)
                        Text(game.opponent)
                    }
                    Spacer()
                    Text(game.gameResult)
                }
                .contentShape(Rectangle())
                .onTapGesture {
                    selectedGame = game
                    opponent = game.opponent
                    opponentScore = game.opponentScore
                    ourScore = game.ourScore
                    goals = game.goals
                    assists = game.assists
                }
            }
            .onDelete { indexSet in
                withAnimation {
                    indexSet.forEach { index in
                        if let game = player.gamesPlayed?[index] {
                            modelContext.delete(game)
                        }
                    }
                }
            }
        }
        .listStyle(.plain)
        .navigationTitle("Games")
    }
}

#Preview {
    let preview = Preview(Player.self)
    let players = Player.samplePlayers
    preview.addExamples(players)
    return NavigationStack {
        GameListView(player: players[0])
            .navigationBarTitleDisplayMode(.inline)
            .modelContainer(preview.container)
    }
}
