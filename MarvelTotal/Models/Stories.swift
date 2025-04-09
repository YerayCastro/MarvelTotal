//
//  Stories.swift
//  MarvelTotal
//
//  Created by Yery Castro on 20/3/25.
//

import Foundation



struct StoriesResponse: Codable {
    let code: Int
    let status, copyright, attributionText, attributionHTML: String
    let etag: String
    let data: StoriesData
}

struct StoriesData: Codable {
    let offset, limit, total, count: Int
    let results: [StoriesComplete]
}

struct StoriesComplete: Codable, Hashable {
    let id: Int
    let title: String
    let description: String?
    let resourceURI: String
    let type: TypeEnum?
    let modified: String
    let thumbnail: Thumbnail?
    let creators, characters, comics: Characters
    let series: Characters?
    let events: Characters
    let originalIssue: OriginalIssue?
    var imageURL3: URL? {
        guard let path = thumbnail?.path.replacingOccurrences(of: "http://", with: "https://"),
              let ext = thumbnail?.imageExtension.rawValue else { return nil }
        return URL(string: "\(path).\(ext)")
    }
    
    static func ==(lhs: StoriesComplete, rhs: StoriesComplete) -> Bool {
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

struct Item: Codable {
    let resourceURI: String
    let name: String
    let role: String?
}

struct OriginalIssue: Codable {
    let resourceURI: String
    let name: String
}
enum TypeEnum: String, Codable {
    case story = "story"
    case collection = "collection"
    case limited = "limited"
    case unknown
    
    init(from decoder: Decoder) throws {
            let container = try decoder.singleValueContainer()
            let value = try? container.decode(String.self)
            self = TypeEnum(rawValue: value ?? "") ?? .unknown
        }
}
