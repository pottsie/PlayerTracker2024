//
//  Game.swift
//  PlayerTracker2024
//
//  Created by Michael Potts on 1/27/24.
//

import Foundation
import SwiftData

@Model
class Game {
    var opponent: String
    var opponentScore: Int
    var ourScore: Int
    var dateOfGame: Date
    var goals: Int
    var assists: Int
//    var shots: Int
//    var shotsOnGoal: Int
    var passAttempts: Int
    var passCompletions: Int
    
    init(
        opponent: String,
        opponentScore: Int = 0,
        ourScore: Int = 0,
        dateOfGame: Date = Date.now,
        goals: Int = 0,
        assists: Int = 0,
//        shots: Int = 0,
//        shotsOnGoal: Int = 0,
        passAttempts: Int = 0,
        passCompletions: Int = 0
    ) {
        self.opponent = opponent
        self.opponentScore = opponentScore
        self.ourScore = ourScore
        self.dateOfGame = dateOfGame
        self.goals = goals
        self.assists = assists
//        self.shots = shots
//        self.shotsOnGoal = shotsOnGoal
        self.passAttempts = passAttempts
        self.passCompletions = passCompletions
    }
    
    var player: Player?
    
    var gameResult: String {
        if ourScore > opponentScore {
            return "W\(ourScore)-\(opponentScore)"
        } else if ourScore < opponentScore {
            return "L\(opponentScore)-\(ourScore)"
        } else {
            return "D\(ourScore)-\(opponentScore)"
        }
    }
    
//    var gamePassingPercentage: Double {
//        Double(self.passCompletions / self.passAttempts)
//    }
}
