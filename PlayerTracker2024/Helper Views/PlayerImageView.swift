//
//  PlayerImageView.swift
//  PlayerTracker2024
//
//  Created by Michael Potts on 12/30/23.
//

import SwiftUI

struct PlayerImageView: View {
    var imageSize: CGFloat
    var imageData: Data?
    var highlightColor: Color
    
    init(imageSize: CGFloat = 250, imageData: Data?, highlightColor: Color = .primary) {
        self.imageSize = imageSize
        self.imageData = imageData
        self.highlightColor = highlightColor
    }
    
    var body: some View {
        ZStack {
            Circle()
                .stroke(lineWidth: imageSize > 125 ? 5 : 3)
                .foregroundColor(highlightColor)
                .frame(width: imageSize, height: imageSize)
                .shadow(color: highlightColor, radius: 10, x: 0, y: 0)
            Image("rowan") // need to convert from Data
                .resizable()
                .scaledToFill()
                .clipShape(Circle())
                .frame(width: imageSize, height: imageSize)
        }
    }
}

#Preview {
    PlayerImageView(imageData: nil)
}
