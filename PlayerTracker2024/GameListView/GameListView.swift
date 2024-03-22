//
//  GameListView.swift
//  PlayerTracker2024
//
//  Created by Michael Potts on 2/1/24.
//

import SwiftUI

struct GameListView: View {
    @Environment(\.modelContext) private var modelContext
//    let player: Player
    @Binding var games: [Game]?
    @State private var opponent = ""
    @State private var opponentScore = 0
    @State private var ourScore = 0
    @State private var goals = 0
    @State private var assists = 0
    @State private var passAttempts = 0
    @State private var passCompletions = 0
    @State private var selectedGame: Game?
    var isEditing: Bool {
        selectedGame != nil
    }
    
    var body: some View {
        GroupBox {
            ScrollView {
                VStack {
                    LabeledContent("Opponent") {
                        TextField("opponent name", text: $opponent)
                            .autocorrectionDisabled()
                        
                    }
                    LabeledContent("Opponent's score") {
                        TextField("", value: $opponentScore, format: .number)
                            .frame(width: 50)
                            .keyboardType(.numberPad)
                        Spacer()
                    }
                    LabeledContent("Our score") {
                        TextField("", value: $ourScore, format: .number)
                            .frame(width: 50)
                            .keyboardType(.numberPad)
                        Spacer()
                    }
                    LabeledContent("Goals") {
                        TextField("", value: $goals, format: .number)
                            .frame(width: 50)
                            .keyboardType(.numberPad)
                        Spacer()
                    }
                    LabeledContent("Assists") {
                        TextField("", value: $assists, format: .number)
                            .frame(width: 50)
                            .keyboardType(.numberPad)
                        Spacer()
                    }
                    LabeledContent("Pass Attempts") {
                        TextField("", value: $passAttempts, format: .number)
                            .frame(width: 50)
                            .keyboardType(.numberPad)
                        Spacer()
                    }
                    LabeledContent("Pass Completions") {
                        TextField("", value: $passCompletions, format: .number)
                            .frame(width: 50)
                            .keyboardType(.numberPad)
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
                                passAttempts = 0
                                passCompletions = 0
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
                                selectedGame?.passAttempts = passAttempts
                                selectedGame?.passCompletions = passCompletions
                                opponent = ""
                                opponentScore = 0
                                ourScore = 0
                                goals = 0
                                assists = 0
                                passAttempts = 0
                                passCompletions = 0
                                selectedGame = nil
                            } else {
                                let game = Game(opponent: opponent, opponentScore: opponentScore, ourScore: ourScore, dateOfGame: Date.now, goals: goals, assists: assists, passAttempts: passAttempts, passCompletions: passCompletions)
    //                            player.gamesPlayed?.append(game)
                                games?.append(game)
                                opponent = ""
                                opponentScore = 0
                                ourScore = 0
                                goals = 0
                                assists = 0
                                passAttempts = 0
                                passCompletions = 0
                            }
                        }
                        .buttonStyle(.borderedProminent)
                        .disabled(opponent.isEmpty)
                    }
                }
                .textFieldStyle(.roundedBorder)
            }
            
        }
        .padding(.horizontal)
        List {
//            let sortedGames = player.gamesPlayed ?? []
            let sortedGames = games ?? []
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
                    passAttempts = game.passAttempts
                    passCompletions = game.passCompletions
                }
            }
            .onDelete { indexSet in
                withAnimation {
                    indexSet.forEach { index in
//                        if let game = player.gamesPlayed?[index] {
                        if let game = games?[index] {
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
        GameListView(games: .constant(players[0].gamesPlayed))
            .navigationBarTitleDisplayMode(.inline)
            .modelContainer(preview.container)
    }
}
