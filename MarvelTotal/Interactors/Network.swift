//
//  Network.swift
//  MarvelTotal
//
//  Created by Yery Castro on 24/3/25.
//

import Foundation

protocol DataInteractor {
    func getCharacters(url: URL, apikey: String, offset: Int, limit: Int) async throws -> [CharactersComplete]
    func getSeries(url: URL, apikey: String, offset: Int, limit: Int) async throws -> [SeriesComplete]
    func getEvents(url: URL, apikey: String, offset: Int, limit: Int) async throws -> [EventsComplete]
    func getStories(url: URL, apikey: String, offset: Int, limit: Int) async throws -> [StoriesComplete]
    func getComics(url: URL, apikey: String, offset: Int, limit: Int) async throws -> [ComicsComplete]
}
struct Network: DataInteractor {
    static let shared = Network()

    
    func getCharacters(url: URL, apikey: String, offset: Int, limit: Int) async throws -> [CharactersComplete] {
        try await getJSON2(request: .getCharacters(url: url, ts: ts, hash: hash, apikey: apikey, offset: offset, limit: limit), type: CharactersResponse.self).data.results
    }
    func getSeries(url: URL, apikey: String, offset: Int, limit: Int) async throws -> [SeriesComplete] {
        try await getJSON2(request: .getCharacters(url: url, ts: ts, hash: hash, apikey: apikey, offset: offset, limit: limit), type: SeriesResponse.self).data.results
    }
    func getEvents(url: URL, apikey: String, offset: Int, limit: Int) async throws -> [EventsComplete] {
        try await getJSON2(request: .getEvents(url: url, ts: ts, hash: hash, apikey: apikey, offset: offset, limit: limit), type: EventsResponse.self).data.results
    }
    func getStories(url: URL, apikey: String, offset: Int, limit: Int) async throws -> [StoriesComplete] {
        try await getJSON2(request: .getStories(url: url, ts: ts, hash: hash, apikey: apikey, offset: offset, limit: limit), type: StoriesResponse.self).data.results
    }
    func getComics(url: URL, apikey: String, offset: Int, limit: Int) async throws -> [ComicsComplete] {
        try await getJSON2(request: .getComics(url: url, ts: ts, hash: hash, apikey: apikey, offset: offset, limit: limit), type: ComicsResponse.self).data.results
    }
}
