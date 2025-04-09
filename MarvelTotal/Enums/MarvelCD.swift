//
//  MarvelCD.swift
//  MarvelTotal
//
//  Created by Yery Castro on 7/4/25.
//

import Foundation

enum MarvelCD: Identifiable, CaseIterable {
    var id: Self { self }
    case characters
    case comic
    case series
    case event
    case story
    case creators
    
    var icon: String {
        switch self {
        case .comic:
            return "book.fill"
        case .series:
            return "tv"
        case .event:
            return "calendar"
        case .story:
            return "doc.fill"
        case .characters:
            return "person.fill"
        case .creators:
            return "person"
        }
    }
    
    var labelCell: String {
        switch self {
        case .comic:
            return "Comic"
        case .series:
            return "Series"
        case .event:
            return "Event"
        case .story:
            return "Story"
        case .characters:
            return "Characters"
        case .creators:
            return "Creators"
        }
    }
}
