//
//  Comics.swift
//  MarvelTotal
//
//  Created by Yery Castro on 16/3/25.
//

import Foundation

struct SeriesResponse: Codable {
    let code: Int
    let status: String
    let copyright: String
    let attributionText: String
    let attributionHTML: String
    let etag: String
    let data: SeriesData
}

struct SeriesData: Codable {
    let offset: Int
    let limit: Int
    let total: Int
    let count: Int
    let results: [SeriesComplete]
}

struct SeriesComplete: Codable, Hashable {
    let id: Int
    let title: String?
    let description: String?
    let resourceURI: String
    let urls: [URLElement]
    let startYear: Int?
    let endYear: Int?
    let rating: String?
    let type: String?
    let modified: String
    let thumbnail: Thumbnail
    let creators: Creators?
    let characters: Characters?
    let stories: Stories
    let comics: Comics
    let events: Events
    var imageURL2: URL? {
        URL(string: "\(thumbnail.path.replacingOccurrences(of: "http://", with: "https://")).\(thumbnail.imageExtension.rawValue)")
    }
    var completeDate: String {
        "\(startYear ?? 0) - \(endYear ?? 0)"
    }
    static func ==(lhs: SeriesComplete, rhs: SeriesComplete) -> Bool {
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

struct Creators: Codable {
    let available: Int
    let collectionURI: String
    let items: [Creator]
    let returned: Int
}

struct Creator: Codable {
    let resourceURI: String
    let name: String
    let role: String
}


struct Character: Codable {
    let resourceURI: String
    let name: String
}

struct Story: Codable {
    let resourceURI: String
    let name: String
    let type: String
}

struct Comic: Codable {
    let resourceURI: String
    let name: String
}

struct Events: Codable {
    let available: Int
    let collectionURI: String
    let items: [Event]
    let returned: Int
}

struct Event: Codable {
    let resourceURI: String
    let name: String
}
struct Characters: Codable {
    let available: Int
    let collectionURI: String
    let items: [SeriesItems]
    let returned: Int
}
struct SeriesItems: Codable {
    let resourceURI: String
    let name: String
}



