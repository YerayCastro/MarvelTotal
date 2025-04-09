//
//  Role.swift
//  MarvelTotal
//
//  Created by Yery Castro on 20/3/25.
//

import Foundation

enum Role: String, Codable {
    case artist = "artist"
    case colorist = "colorist"
    case coloristCover = "colorist (cover)"
    case editor = "editor"
    case inker = "inker"
    case inkerCover = "inker (cover)"
    case letterer = "letterer"
    case other = "other"
    case painterCover = "painter (cover)"
    case penciler = "penciler"
    case pencilerCover = "penciler (cover)"
    case penciller = "penciller"
    case pencillerCover = "penciller (cover)"
    case roleLetterer = "Letterer"
    case writer = "writer"
}
