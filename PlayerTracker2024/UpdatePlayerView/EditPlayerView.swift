//
//  EditPlayerView.swift
//  PlayerTracker2024
//
//  Created by Michael Potts on 1/4/24.
//

import SwiftUI

struct EditPlayerView: View {
    @Environment(\.dismiss) private var dismiss
    
    @State private var firstName = ""
    @State private var lastName = ""
    @State private var position: String = ""
    @State private var jerseyNumber: String = ""
    @State private var dateOfBirth: Date = Date.now
    @State private var height: Int = 0
    @State private var club: String = ""
    @State private var highSchool: String = ""
    @State private var phone: String = ""
    @State private var emailAddress: String = ""
    @State private var photo: Data?
    
    let player: Player
    
    var body: some View {
        NavigationStack {
            VStack {
                // TODO: need to add section for the player image
                
                Group { // personal data
                    LabeledContent {
                        TextField("", text: $firstName)
                    } label: {
                        Text("First name").foregroundStyle(.secondary)
                    }
                    LabeledContent {
                        TextField("", text: $lastName)
                    } label: {
                        Text("Last name").foregroundStyle(.secondary)
                    }
                    LabeledContent {
                        DatePicker("", selection: $dateOfBirth, displayedComponents: .date)
                    } label: {
                        Text("Date of Birth")
                    }
                    .foregroundStyle(.secondary)
                    LabeledContent {
                        TextField("", value: $height, format: .number)
                    } label: {
                        Text("Height (cm)").foregroundStyle(.secondary)
                    }
                }
                Group {
                    LabeledContent {
                        TextField("", text: $highSchool)
                    } label: {
                        Text("High School").foregroundStyle(.secondary)
                    }
                    LabeledContent {
                        TextField("", text: $emailAddress)
                    } label: {
                        Text("Email").foregroundStyle(.secondary)
                    }
                    LabeledContent {
                        TextField("", text: $phone)
                    } label: {
                        Text("Phone").foregroundStyle(.secondary)
                    }
                }
//            }
                Divider()
                Group { // soccer related player data
                    LabeledContent {
                        TextField("", text: $position)
                    } label: {
                        Text("Position").foregroundStyle(.secondary)
                    }
                    LabeledContent {
                        TextField("", text: $jerseyNumber)
                    } label: {
                        Text("Jersey #").foregroundStyle(.secondary)
                    }
                    LabeledContent {
                        TextField("", text: $club)
                    } label: {
                        Text("Club").foregroundStyle(.secondary)
                    }
                }
                Spacer()
            }
            .padding()
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                        dismiss()
                    } label: {
                        Text("Cancel")
                    }
                    .buttonStyle(.borderedProminent).tint(.red)
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        
                    } label: {
                        Text("Save")
                    }
                    .buttonStyle(.borderedProminent)
                }
            }
        }
        .textFieldStyle(.roundedBorder)
        .navigationTitle("Edit Player")
        .navigationBarTitleDisplayMode(.inline)
        .onAppear {
            firstName = player.firstName
            lastName = player.lastName
            position = player.position
            jerseyNumber = player.jerseyNumber
            dateOfBirth = player.dateOfBirth
            height = player.height
            club = player.club
            highSchool = player.highSchool
            phone = player.phone
            emailAddress = player.emailAddress
            photo = player.photo
        }
    }
}

#Preview {
    let preview = Preview(Player.self)
    return NavigationStack {
        EditPlayerView(player: Player.samplePlayers[0])
            .modelContainer(preview.container)
    }
}
