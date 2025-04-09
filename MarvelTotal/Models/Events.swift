//
//  Events.swift
//  MarvelTotal
//
//  Created by Yery Castro on 18/3/25.
//

import Foundation


struct EventsResponse: Codable {
    let code: Int
    let status, copyright, attributionText, attributionHTML: String
    let etag: String
    let data: EventsData
}

struct EventsData: Codable {
    let offset, limit, total, count: Int
    let results: [EventsComplete]
}

struct EventsComplete: Codable, Hashable {
    let id: Int
    let title, description: String
    let resourceURI: String
    let urls: [URLElement]
    let modified: String
    let start, end: String?
    let thumbnail: Thumbnail
    let creators: Creators
    let characters: Characters
    let stories: Stories
    let comics, series: Characters
    let next, previous: Next?
    var imageURL3: URL? {
        URL(string: "\(thumbnail.path.replacingOccurrences(of: "http://", with: "https://")).\(thumbnail.imageExtension.rawValue)")
    }

    static func ==(lhs: EventsComplete, rhs: EventsComplete) -> Bool {
            return lhs.id == rhs.id
        }
    func hash(into hasher: inout Hasher) {
            hasher.combine(id)
            hasher.combine(title)
            hasher.combine(description)
            hasher.combine(modified)
            hasher.combine(resourceURI)
        }
}

struct Next: Codable {
    let resourceURI: String
    let name: String
}

