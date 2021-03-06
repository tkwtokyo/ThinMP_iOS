//
//  PlaylistsPageView.swift
//  ThinMP
//
//  Created by tk on 2021/04/10.
//

import SwiftUI

struct PlaylistsPageView: View {
    @StateObject private var vm = PlaylistsViewModel()
    @State private var headerRect = CGRect()

    var body: some View {
        GeometryReader { geometry in
            VStack(spacing: 0) {
                ZStack(alignment: .top) {
                    ListNavBarView(top: geometry.safeAreaInsets.top, rect: $headerRect) {
                        HStack {
                            BackButtonView()
                            Spacer()
                            HeaderTitleView("Playlists")
                            Spacer()
                            EditButtonView {
                                PlaylistsEditPageView()
                            }
                        }
                    }
                    ScrollView {
                        VStack(alignment: .leading) {
                            ListEmptyHeaderView(headerRect: $headerRect, top: geometry.safeAreaInsets.top)
                            LazyVStack(spacing: 0) {
                                ForEach(vm.playlists.indices, id: \.self) { index in
                                    NavigationLink(destination: PlaylistDetailPageView(playlistId: vm.playlists[index].playlistId)) {
                                        MediaRowView(media: vm.playlists[index])
                                    }
                                    .contentShape(RoundedRectangle(cornerRadius: StyleConstant.cornerRadius))
                                    .contextMenu {
                                        PlaylistDeleteButtonView(playlistId: vm.playlists[index].playlistId, callback: { vm.load() })
                                        ShortcutButtonView(itemId: vm.playlists[index].id, type: ShortcutType.PLAYLIST)
                                    }
                                    Divider()
                                }.padding(.leading, StyleConstant.Padding.medium)
                            }
                        }
                    }
                    .frame(alignment: .top)
                }
                MiniPlayerView(bottom: geometry.safeAreaInsets.bottom)
            }
            .navigationBarHidden(true)
            .navigationBarTitle(Text(""))
            .edgesIgnoringSafeArea(.all)
            .onAppear {
                vm.load()
            }
        }
    }
}
