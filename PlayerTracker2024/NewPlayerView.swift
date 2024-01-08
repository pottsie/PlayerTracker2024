//
//  NewPlayerView.swift
//  PlayerTracker2024
//
//  Created by Michael Potts on 1/7/24.
//

import SwiftUI

struct NewPlayerView: View {
    @Environment(\.dismiss) var dismiss
    @Environment(\.modelContext) private var context
    @State private var firstName = ""
    @State private var lastName = ""
    
    var body: some View {
        NavigationStack {
            Form {
                TextField("First Name", text: $firstName)
                TextField("Last Name", text: $lastName)
                Button("Create") {
                    let newPlayer = Player(firstName: firstName, lastName: lastName)
                    context.insert(newPlayer)
                    dismiss()
                }
                .frame(maxWidth: .infinity, alignment: .trailing)
                .buttonStyle(.borderedProminent)
                .padding(.vertical)
                .disabled(firstName.isEmpty || lastName.isEmpty)
                .navigationTitle("New Player")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .topBarLeading) {
                        Button {
                            dismiss()
                        } label: {
                            Text("Cancel")
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    NewPlayerView()
}
