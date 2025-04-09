//
//  URL.swift
//  MarvelTotal
//
//  Created by Yery Castro on 13/3/25.
//

import Foundation

let privateKey = "3ea6c775e5fa4c70ec8c854d1d9c788ba8f78a86"
let publicKey = "705c81713fe9baf57c60aad163a5272e"
let hash = "64d6714509d1d5118ed5684ac4a52afa"
let ts = 1

let api = URL(string: "https://gateway.marvel.com/v1/public/")!

extension URL {
    static let urlGetCharacters = api.appending(path: "characters")
    static let urlGetSeries = api.appending(path: "series")
    static let urlGetEvents = api.appending(path: "events")
    static let urlGetStories = api.appending(path: "stories")
    static let urlGetComics = api.appending(path: "comics")
}
