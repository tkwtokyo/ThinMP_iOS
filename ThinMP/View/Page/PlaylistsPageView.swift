//
//  PlaylistsPageView.swift
//  ThinMP
//
//  Created by tk on 2021/04/10.
//

import SwiftUI

struct PlaylistsPageView: View {
    private let TITLE: String = "Playlists"

    @ObservedObject var playlists = PlaylistViewModel()
    @State private var headerRect: CGRect = CGRect()

    var body: some View {
        GeometryReader { geometry in
            VStack(spacing: 0) {
                ZStack(alignment: .top) {
                    ListNavBarView(top: geometry.safeAreaInsets.top, rect: $headerRect) {
                        HStack {
                            BackButtonView()
                            Spacer()
                            PrimaryTextView(TITLE)
                            Spacer()
                            EditButtonView {
                                PlaylistsEditPageView(playlists: playlists)
                            }
                        }
                    }
                    ScrollView() {
                        VStack(alignment: .leading) {
                            ListEmptyHeaderView(headerRect: self.$headerRect, top: geometry.safeAreaInsets.top)
                            LazyVStack() {
                                ForEach(self.playlists.list.indices, id: \.self) { index in
                                    NavigationLink(destination: PlaylistDetailPageView(vm: PlaylistDetailViewModel(playlistId: self.playlists.list[index].id), playlistId: self.playlists.list[index].id)) {
                                        PlaylistRowView(title: self.playlists.list[index].name)
                                    }
                                    Divider()
                                }.padding(.leading, 10)
                            }
                        }
                    }
                    .frame(alignment: .top)
                }
                .edgesIgnoringSafeArea(.all)
                .navigationBarHidden(true)
                .navigationBarTitle(Text(""))
                .onAppear() {
                    playlists.load()
                }
                MiniPlayerView(bottom: geometry.safeAreaInsets.bottom)
            }
            .edgesIgnoringSafeArea(.all)
        }
    }
}
