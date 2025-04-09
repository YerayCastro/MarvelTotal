//
//  Characters.swift
//  MarvelTotal
//
//  Created by Yery Castro on 13/3/25.
//

import Foundation

struct CharactersResponse: Codable {
    let code: Int
    let status, copyright, attributionText, attributionHTML: String
    let etag: String
    let data: CharacterData
}

struct CharacterData: Codable {
    let offset, limit, total, count: Int?
    let results: [CharactersComplete]
}

struct CharactersComplete: Codable, Equatable, Identifiable, Hashable {
    let id: Int
    let name, description: String
    let modified: String
    let thumbnail: Thumbnail
    let resourceURI: String
    let comics, series: Comics
    let stories: Stories
    let events: Comics
    let urls: [URLElement]
    var imageURL: URL? {
        URL(string: "\(thumbnail.path.replacingOccurrences(of: "http://", with: "https://")).\(thumbnail.imageExtension.rawValue)")
    }
    static func ==(lhs: CharactersComplete, rhs: CharactersComplete) -> Bool {
            return lhs.id == rhs.id 
        }
    func hash(into hasher: inout Hasher) {
            hasher.combine(id)
            hasher.combine(name)
            hasher.combine(description)
            hasher.combine(modified)
            hasher.combine(resourceURI)
        }
    
    
}

struct Comics: Codable {
    let available: Int
    let collectionURI: String
    let items: [ComicsItem]
    let returned: Int
}

struct ComicsItem: Codable {
    let resourceURI: String
    let name: String
}

struct Stories: Codable {
    let available: Int
    let collectionURI: String
    let items: [StoriesItem]
    let returned: Int
}

struct StoriesItem: Codable {
    let resourceURI: String
    let name: String
    let type: ItemType
}

enum ItemType: String, Codable {
    case cover = "cover"
    case empty = ""
    case backcover = "backcovers"
    case interiorStory = "interiorStory"
    case pinup = "pinup"
    case pinup2 = "pin-up"
    case ad = "ad"
    case textArticle = "text article"
    case recap = "recap"
    case type = "type"
    case letters = "letters"
    case profile = "profile"
    case promo = "promo"
    case textStory = "text story"
    case coverReprint = "cover reprint"
    case mysteryStory = "mystery story"
    case textFeature = "text feature"
    case activity = "activity"
    case statementOfOwnership = "statement of ownership"
    case tradingCardInsert = "trading card insert"
    case ads = "ads"
    case preview = "preview"
    case textPage = "text page"
    case features = "features"
    case unknown  // Para manejar valores inesperados

        init(from decoder: Decoder) throws {
            let container = try decoder.singleValueContainer()
            let value = try? container.decode(String.self)
            self = ItemType(rawValue: value ?? "") ?? .unknown
        }
}

struct Thumbnail: Codable {
    let path: String
    let imageExtension: ImageExtension

    enum CodingKeys: String, CodingKey {
        case path
        case imageExtension = "extension"
    }
}

enum ImageExtension: String, Codable {
    case gif = "gif"
    case jpg = "jpg"
    case png = "png"
}


struct URLElement: Codable {
    let type: URLType
    let url: String
}

enum URLType: String, Codable {
    case comiclink = "comiclink"
    case detail = "detail"
    case wiki = "wiki"
    case inAppLink = "inAppLink"
    case purchase = "purchase"
    case reader = "reader"
}
