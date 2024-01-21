//
//  UpdatePlayer.swift
//  PlayerTracker2024
//
//  Created by Michael Potts on 1/18/24.
//

import SwiftData
import PhotosUI
import SwiftUI

struct UpdatePlayer: View {
    let player: Player
    @State private var selectedItem: PhotosPickerItem?
    @Environment(\.dismiss) private var dismiss
    @State private var firstName = ""
    @State private var lastName = ""
    @State private var height = 0
    @State private var dateOfBirth = Date()
    @State private var position = ""
    @State private var jerseyNumber = ""
    @State private var phone = ""
    @State private var emailAddress = ""
    @State private var highSchool = ""
    @State private var club = ""
    @State private var photo: Data?
    
    var body: some View {
        NavigationStack {
            VStack {
                
                ZStack {
                    PlayerImageView(imageData: photo)
                        .padding(.vertical)
                    
                    PhotosPicker(selection: $selectedItem) {
                        Text("Click to change")
                    }
//                    Button {
//                        
//                    } label: {
//                        Text("Click to change")
//                    }
                    .buttonStyle(.borderedProminent)
                }
                
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
                        TextField("", value: $height, format: .number)
                    } label: {
                        Text("Height (cm)").foregroundStyle(.secondary)
                    }
                    LabeledContent {
                        DatePicker("", selection: $dateOfBirth, in: ...Date.now, displayedComponents: .date)
                    } label: {
                        Text("Date of Birth").foregroundStyle(.secondary)
                    }
                    LabeledContent {
                        TextField("", text: $phone)
                    } label: {
                        Text("Phone").foregroundStyle(.secondary)
                    }
                    LabeledContent {
                        TextField("", text: $emailAddress)
                    } label: {
                        Text("Email").foregroundStyle(.secondary)
                    }
                    LabeledContent {
                        TextField("", text: $highSchool)
                    } label: {
                        Text("High School").foregroundStyle(.secondary)
                    }
                }
                
                Group { // soccer data
                    LabeledContent {
                        TextField("", text: $position)
                    } label: {
                        Text("Position").foregroundStyle(.secondary)
                    }
                    LabeledContent {
                        TextField("", text: $jerseyNumber)
                    } label: {
                        Text("Jersey number").foregroundStyle(.secondary)
                    }
                    LabeledContent {
                        TextField("", text: $club)
                    } label: {
                        Text("Club").foregroundStyle(.secondary)
                    }
                }
                
                Spacer()
                
            }
            .navigationTitle("Edit Player")
            .navigationBarTitleDisplayMode(.inline)
            .textFieldStyle(.roundedBorder)
            .padding()
            .onChange(of: selectedItem, loadPhoto)
            .onAppear {
                firstName = player.firstName
                lastName = player.lastName
                height = player.height
                dateOfBirth = player.dateOfBirth
                position = player.position
                jerseyNumber = player.jerseyNumber
                highSchool = player.highSchool
                phone = player.phone
                emailAddress = player.emailAddress
                club = player.club
            }
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                        dismiss()
                    } label: {
                        Text("Cancel")
                    }
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        player.firstName = firstName
                        player.lastName = lastName
                        player.height = height
                        player.position = position
                        player.dateOfBirth = dateOfBirth
                        player.jerseyNumber = jerseyNumber
                        player.highSchool = highSchool
                        player.phone = phone
                        player.emailAddress = emailAddress
                        player.club = club
                        player.photo = photo
                        dismiss()
                    } label: {
                        Text("Update")
                    }
                    .buttonStyle(.borderedProminent)
                    .disabled(!changed)
                }
            }
        }
    }
    
    var changed: Bool {
        firstName != player.firstName ||
        lastName != player.lastName ||
        height != player.height ||
        dateOfBirth != player.dateOfBirth ||
        position != player.position ||
        jerseyNumber != player.jerseyNumber ||
        highSchool != player.highSchool ||
        phone != player.phone ||
        emailAddress != player.emailAddress ||
        club != player.club ||
        photo != player.photo
    }
    
    func loadPhoto() {
        Task { @MainActor in
            photo = try await selectedItem?.loadTransferable(type: Data.self)
        }
    }
}

#Preview {
    let preview = Preview(Player.self)
    return NavigationStack {UpdatePlayer(player: Player.samplePlayers[1])
            .modelContainer(preview.container)
    }
}
