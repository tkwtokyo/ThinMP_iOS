//
//  ShortcutModel.swift
//  ThinMP
//
//  Created by tk on 2021/05/08.
//

import Foundation
import RealmSwift

enum ShortcutType: Int {
    case ARTIST = 1
    case ALBUM = 2
    case PLAYLIST = 3
}
enum ShortcutText: String {
    case ARTIST = "Artist"
    case ALBUM = "Album"
    case PLAYLIST = "Playlist"
}
class ShortcutModel: Object, MediaProtocol, Identifiable {
    @objc dynamic var id: String = UUID().uuidString
    @objc dynamic var itemId: String = ""
    @objc dynamic var type: Int = ShortcutType.ARTIST.rawValue
    @objc dynamic var order: Int = 1

    override static func primaryKey() -> String? {
        return "id"
    }

    var primaryText: String? {
        get {
            self.primaryText
        }
        set(primaryText) {
            self.primaryText = primaryText
        }
    }
    var secondaryText: String? {
        get {
            if (type == ShortcutType.ARTIST.rawValue) {
                return ShortcutText.ARTIST.rawValue
            } else if (type == ShortcutType.ALBUM.rawValue) {
                return ShortcutText.ALBUM.rawValue
            } else if(type == ShortcutType.PLAYLIST.rawValue) {
                return ShortcutText.PLAYLIST.rawValue
            } else {
                return ""
            }
        }
    }
}