//
//  SongsViewModel.swift
//  ThinMP
//
//  Created by tk on 2020/01/13.
//

import MediaPlayer

class SongsViewModel: ObservableObject {
    @Published var list: [Song] = []
    
    init () {
        if MPMediaLibrary.authorizationStatus() == .authorized {
            fetch()
        } else {
            MPMediaLibrary.requestAuthorization { status in
                if status == .authorized {
                    self.fetch()
                }
            }
        }
    }
    
    func fetch() {
        let property = MPMediaPropertyPredicate(value: false, forProperty: MPMediaItemPropertyIsCloudItem)
        let query = MPMediaQuery.songs()

        query.addFilterPredicate(property)
        
        list = query.collections!.enumerated().map{
            let offset = $0.offset
            let item = $0.element.representativeItem

            return Song(id: offset, title: item?.title, artist: item?.artist, artwork: item?.artwork)
        }
    }
}
