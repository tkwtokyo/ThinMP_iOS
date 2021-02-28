//
//  AlbumDetailPageView.swift
//  ThinMP
//
//  Created by tk on 2020/01/12.
//

import SwiftUI
import MediaPlayer

struct AlbumDetailPageView: View {
    @ObservedObject var albumDetail: AlbumDetailViewModel
    @State private var textRect: CGRect = CGRect.zero
    
    init(persistentId: MPMediaEntityPersistentID) {
        self.albumDetail = AlbumDetailViewModel(persistentId: persistentId)
    }
    
    var body: some View {
        GeometryReader { geometry in
            VStack(spacing: 0) {
                ZStack(alignment: .top) {
                    CustomNavBarView(persistentId: self.albumDetail.persistentId, primaryText: self.albumDetail.title, secondaryText: self.albumDetail.artist, side: geometry.size.width, top: geometry.safeAreaInsets.top, textRect: self.$textRect)
                    ScrollView(showsIndicators: true) {
                        VStack(alignment: .leading) {
                            AlbumDetailHeaderView(albumDetail: self.albumDetail, textRect: self.$textRect, side: geometry.size.width, top: geometry.safeAreaInsets.top)
                            ForEach(self.albumDetail.songs.indices){ index in
                                PlayRowView(list: self.albumDetail.songs, index: index) {
                                    AlbumSongRowView(song: self.albumDetail.songs[index])
                                }
                                Divider()
                            }.padding(.leading, 10)
                        }
                    }
                    .navigationBarHidden(true)
                    .navigationBarTitle(Text(""))
                }
                MiniPlayerView(bottom: geometry.safeAreaInsets.bottom)
            }
            .edgesIgnoringSafeArea(.all)
        }
    }
}
