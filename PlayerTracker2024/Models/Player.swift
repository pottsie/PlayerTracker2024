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
    var position: String = ""
    var jerseyNumber: String = ""
    var dateOfBirth: Date = Date.now
    var height: Int = 0
    var club: String = ""
    var highSchool: String = ""
    var phone: String = ""
    var emailAddress: String = ""
    @Attribute(.externalStorage) var photo: Data?
    
    init(firstName: String, lastName: String, position: String, jerseyNumber: String, dateOfBirth: Date, height: Int, club: String, highSchool: String, phone: String, emailAddress: String, photo: Data? = nil) {
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
    }
    
    var fullName: String {
        firstName + " " + lastName
    }
}
