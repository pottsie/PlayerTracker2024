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
                dateOfBirth: Date.now,
                height: 165,
                club: "SCAA",
                highSchool: "South County",
                phone: "5712550187",
                emailAddress: "nfl_noah@icloud.com",
                photo: UIImage(named: "rowan")!.pngData()
            ),
            Player(
                firstName: "George",
                lastName: "Smith",
                position: "Goalie",
                jerseyNumber: "25",
                dateOfBirth: Date.now,
                height: 172,
                club: "LMVSC",
                highSchool: "Hayfield",
                phone: "8888881234",
                emailAddress: "george@gmail.com"
            )
        ]
    }
}
