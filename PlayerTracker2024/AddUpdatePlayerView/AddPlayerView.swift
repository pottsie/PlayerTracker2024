//
//  AddPlayerView.swift
//  PlayerTracker2024
//
//  Created by Michael Potts on 1/4/24.
//

import SwiftUI

struct AddPlayerView: View {
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
                        TextField("", value: $height, format: .number)
                    } label: {
                        Text("Height (cm)").foregroundStyle(.secondary)
                    }
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
        }
        .textFieldStyle(.roundedBorder)
        .navigationTitle("Add Player")
    }
}

#Preview {
    NavigationStack {
        AddPlayerView()
    }
}
