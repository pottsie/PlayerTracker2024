//
//  PlayerSamples.swift
//  PlayerTracker2024
//
//  Created by Michael Potts on 12/30/23.
//

import Foundation
import UIKit

extension Player {
    static var samplePlayers: [Player] {
        [
            Player(
                firstName: "Noah",
                lastName: "Potts",
                position: "Center Defensive Midfield",
                jerseyNumber: "6",
                dateOfBirth: dateFromISOString("2007-01-06"),
                height: 165,
                club: "SCAA",
                highSchool: "South County",
                phone: "571-255-0187",
                emailAddress: "nfl_noah@icloud.com",
                photo: UIImage(named: "rowan")!.pngData()
//                gamesPlayed: [
//                    Game(opponent: "SYC", opponentScore: 0, ourScore: 2, dateOfGame: Date.now, goals: 1, assists: 1, shots: 4, shotsOnGoal: 2, passAttempts: 9, passCompletions: 5)
//                ]
            ),
            Player(
                firstName: "George",
                lastName: "Smith",
                position: "Goalie",
                jerseyNumber: "25",
                dateOfBirth: dateFromISOString("1966-09-20"),
                height: 172,
                club: "LMVSC",
                highSchool: "Hayfield",
                phone: "888-888-1234",
                emailAddress: "george@gmail.com"
            ),
            Player(
                firstName: "Curt",
                lastName: "Jackson",
                position: "Center Back",
                jerseyNumber: "99",
                dateOfBirth: dateFromISOString("2010-01-11"),
                height: 158,
                club: "Alexandria",
                highSchool: "Carman",
                phone: "123-456-7890",
                emailAddress: "gamer@gmail.com"
            )
        ]
    }
    
    static func dateFromISOString(_ isoString: String) -> Date {
        let isoDateFormatter = ISO8601DateFormatter()
            isoDateFormatter.formatOptions = [.withFullDate]  // ignores time!
            return isoDateFormatter.date(from: isoString)!
    }
}
