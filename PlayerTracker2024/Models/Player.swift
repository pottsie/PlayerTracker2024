//
//  Player.swift
//  PlayerTracker2024
//
//  Created by Michael Potts on 12/30/23.
//

import Foundation
import SwiftData

@Model
class Player {
    var firstName: String
    var lastName: String
    var position: String
    var jerseyNumber: String
    var dateOfBirth: Date
    var height: Int
    var club: String
    var highSchool: String
    var phone: String
    var emailAddress: String
    @Attribute(.externalStorage) var photo: Data?
    @Relationship(deleteRule: .cascade)
    var gamesPlayed: [Game]?
    
    init(
        firstName: String,
        lastName: String,
        position: String = "",
        jerseyNumber: String = "",
        dateOfBirth: Date = Date.now,
        height: Int = 0,
        club: String = "",
        highSchool: String = "",
        phone: String = "",
        emailAddress: String = "",
        photo: Data? = nil
//        gamesPlayed: [Game]? = nil
    ) {
        self.firstName = firstName
        self.lastName = lastName
        self.position = position
        self.jerseyNumber = jerseyNumber
        self.dateOfBirth = dateOfBirth
        self.height = height
        self.club = club
        self.highSchool = highSchool
        self.phone = phone
        self.emailAddress = emailAddress
        self.photo = photo
//        self.gamesPlayed = gamesPlayed
    }
    
    var fullName: String {
        firstName + " " + lastName
    }
    
    var goalsScored: Int {
        var goals = 0
        if let games = gamesPlayed {
            for game in games {
                goals += game.goals
            }
            return goals
        } else {
            return 0
        }
    }
    
    var assists: Int {
        var assists = 0
        if let games = gamesPlayed {
            for game in games {
                assists += game.assists
            }
            return assists
        } else {
            return 0
        }
    }
}
