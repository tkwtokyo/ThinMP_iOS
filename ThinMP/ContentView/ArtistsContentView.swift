//
//  ArtistsContentView.swift
//  ThinMP
//
//  Created by tk on 2020/01/05.
//

import SwiftUI

struct ArtistsContentView: View {
    @ObservedObject var artists = Artists()
    
    var body: some View {
        List(artists.list){ artist in
            NavigationLink(destination: ArtistDetailContentView(artist: artist)) {
                ArtistRowView(artist: artist)
            }
        }
    }
}

struct ArtistsContentView_Previews: PreviewProvider {
    static var previews: some View {
        ArtistsContentView()
    }
}
