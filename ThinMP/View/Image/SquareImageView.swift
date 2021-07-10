//
//  SquareImageView.swift
//  ThinMP
//
//  Created by tk on 2020/01/22.
//

import SwiftUI
import MediaPlayer

struct SquareImageView: View {
    let artwork: MPMediaItemArtwork?
    let size: CGFloat
    
    var body: some View {
        Image(uiImage: artwork?.image(at: CGSize(width: size, height: size)) ?? UIImage(imageLiteralResourceName: "Song"))
            .renderingMode(.original)
            .resizable()
            .scaledToFit()
            .cornerRadius(4)
            .overlay(
                RoundedRectangle(cornerRadius: 4)
                    .stroke(Color(UIColor.secondarySystemBackground), lineWidth: 1)
            )
            .frame(width: abs(size), height: abs(size))
    }
}
