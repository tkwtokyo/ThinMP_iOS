//
//  ArtistDetailContentView.swift
//  ThinMP
//
//  Created by tk on 2020/01/07.
//

import SwiftUI

struct ArtistDetailContentView: View {
    var artist: Artist

    var body: some View {
        Text(artist.name)
    }
}