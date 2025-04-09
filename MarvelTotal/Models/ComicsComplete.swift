//
//  ComicsComplete.swift
//  MarvelTotal
//
//  Created by Yery Castro on 1/4/25.
//

import Foundation

struct ComicsResponse: Codable {
    let code: Int
    let status, copyright, attributionText, attributionHTML: String
    let etag: String
    let data: DataClass
}

struct DataClass: Codable {
    let offset, limit, total, count: Int
    let results: [ComicsComplete]
}

struct ComicsComplete: Equatable, Codable, Identifiable, Hashable {
    let id, digitalID: Int
    let title: String
    let issueNumber: Int
    let variantDescription: String
    let description: String?
    let modified: String
    let isbn: String
    let upc: String
    let diamondCode: String
    let ean, issn: String
    let format: Format
    let pageCount: Int
    let textObjects: [TextObject]
    let resourceURI: String
    let urls: [URLElement]
    let series: Series
    let variants, collections, collectedIssues: [Series]
    let dates: [DateElement]
    let prices: [Price]
    let thumbnail: Thumbnail
    let images: [Thumbnail]
    let creators: Creators
    let characters: Characters
    let stories: Stories
    let events: Characters
    var imageURL3: URL? {
        URL(string: "\(thumbnail.path.replacingOccurrences(of: "http://", with: "https://")).\(thumbnail.imageExtension.rawValue)")
    }
    
    static func ==(lhs: ComicsComplete, rhs: ComicsComplete) -> Bool {
            return lhs.id == rhs.id
        }
    func hash(into hasher: inout Hasher) {
            hasher.combine(id)
            hasher.combine(title)
            hasher.combine(description)
            hasher.combine(modified)
            hasher.combine(resourceURI)
        }

    enum CodingKeys: String, CodingKey {
        case id
        case digitalID = "digitalId"
        case title, issueNumber, variantDescription, description, modified, isbn, upc, diamondCode, ean, issn, format, pageCount, textObjects, resourceURI, urls, series, variants, collections, collectedIssues, dates, prices, thumbnail, images, creators, characters, stories, events
    }
}

struct Series: Codable {
    let resourceURI: String
    let name: String
}

struct DateElement: Codable {
    let type: DateType
    let date: String
}



enum ModifiedEnum: String, Codable {
    case the00011130T0000000000 = "-0001-11-30T00:00:00+0000"
}

enum DateType: String, Codable {
    case digitalPurchaseDate = "digitalPurchaseDate"
    case focDate = "focDate"
    case onsaleDate = "onsaleDate"
    case unlimitedDate = "unlimitedDate"
}

enum Description: String, Codable {
    case empty = ""
    case nA = "#N/A"
}

enum DiamondCode: String, Codable {
    case empty = ""
    case jul190068 = "JUL190068"
    case aug082435 = "AUG082435"
}

enum Format: String, Codable {
    case comic = "Comic"
    case empty = ""
    case tradePaperback = "Trade Paperback"
    case digitalComic = "DIGITAL COMIC"
    case hardCover = "Hardcover"
    case digest = "Digest"
}



enum Isbn: String, Codable {
    case empty = ""
    case the0785107991 = "0-7851-0799-1"
    case the0785111298 = "0-7851-1129-8"
    case the9780785121787 = "978-0-7851-2178-7"
    case the0785114513 = "0-7851-1451-3"
    
}

// MARK: - Price
struct Price: Codable {
    let type: PriceType
    let price: Double
}

enum PriceType: String, Codable {
    case digitalPurchasePrice = "digitalPurchasePrice"
    case printPrice = "printPrice"
}





// MARK: - TextObject
struct TextObject: Codable {
    let type: TextObjectType
    let language: Language
    let text: String
}

enum Language: String, Codable {
    case enUs = "en-us"
}

enum TextObjectType: String, Codable {
    case issueSolicitText = "issue_solicit_text"
    case issuePreviewText = "issue_preview_text"
}



enum URLType2: String, Codable {
    case detail = "detail"
    case inAppLink = "inAppLink"
    case purchase = "purchase"
    case reader = "reader"
}

