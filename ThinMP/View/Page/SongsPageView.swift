//
//  SongsPageView.swift
//  ThinMP
//
//  Created by tk on 2020/01/13.
//

import SwiftUI

struct SongsPageView: View {
    private let TITLE: String = "Songs"

    @ObservedObject var songs = SongsViewModel()
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
                            Spacer()
                                .frame(width: 50)
                        }
                    }
                    ScrollView() {
                        VStack(alignment: .leading) {
                            ListEmptyHeaderView(headerRect: self.$headerRect, top: geometry.safeAreaInsets.top)
                            LazyVStack() {
                                ForEach(self.songs.list.indices, id: \.self) { index in
                                    PlayRowView(list: self.songs.list, index: index) {
                                        MediaRowView(media: self.songs.list[index])
                                    }
                                    Divider()
                                }
                                .padding(.leading, 10)
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
            .onAppear() {
                songs.load()
            }
        }
    }
}
