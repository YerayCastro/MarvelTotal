//
//  URLRequest.swift
//  MarvelTotal
//
//  Created by Yery Castro on 13/3/25.
//

import Foundation

extension URLRequest {
    static func get(url: URL) -> URLRequest {
        var request = URLRequest(url: url)
        request.timeoutInterval = 60
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        return request
    }
    
    static func post<JSON>(url: URL, data: JSON, method: String = "POST") -> URLRequest where JSON: Codable {
        var request = URLRequest(url: url)
        request.timeoutInterval = 60
        request.httpMethod = method
        request.setValue("application/json; charset=utf8", forHTTPHeaderField: "Content-Type")
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.httpBody = try? JSONEncoder().encode(data)
        return request
    }
    
    static func getCharacters(url: URL, ts: Int = 1, hash: String, apikey: String, offset: Int, limit: Int) -> URLRequest {
        let ts = URLQueryItem(name: "ts", value: String(ts))
        let apikey = URLQueryItem(name: "apikey", value: String(apikey))
        let hash = URLQueryItem(name: "hash", value: String(hash))
        let offset = URLQueryItem(name: "offset", value: String(offset))
        let limit = URLQueryItem(name: "limit", value: String(limit))
        var request = URLRequest(url: url)
        request.url?.append(queryItems: [ts, apikey, hash, offset, limit])
        request.httpMethod = "GET"
        request.timeoutInterval = 60
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        return request
    }
    static func getSeries(url: URL, ts: Int = 1, hash: String, apikey: String, offset: Int, limit: Int) -> URLRequest {
        let ts = URLQueryItem(name: "ts", value: String(ts))
        let apikey = URLQueryItem(name: "apikey", value: String(apikey))
        let hash = URLQueryItem(name: "hash", value: String(hash))
        let offset = URLQueryItem(name: "offset", value: String(offset))
        let limit = URLQueryItem(name: "limit", value: String(limit))
        var request = URLRequest(url: url)
        request.url?.append(queryItems: [ts, apikey, hash, offset, limit])
        request.httpMethod = "GET"
        request.timeoutInterval = 60
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        return request
    }
    static func getEvents(url: URL, ts: Int = 1, hash: String, apikey: String, offset: Int, limit: Int) -> URLRequest {
        let ts = URLQueryItem(name: "ts", value: String(ts))
        let apikey = URLQueryItem(name: "apikey", value: String(apikey))
        let hash = URLQueryItem(name: "hash", value: String(hash))
        let offset = URLQueryItem(name: "offset", value: String(offset))
        let limit = URLQueryItem(name: "limit", value: String(limit))
        var request = URLRequest(url: url)
        request.url?.append(queryItems: [ts, apikey, hash, offset, limit])
        request.httpMethod = "GET"
        request.timeoutInterval = 60
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        return request
    }
    static func getStories(url: URL, ts: Int = 1, hash: String, apikey: String, offset: Int, limit: Int) -> URLRequest {
        let ts = URLQueryItem(name: "ts", value: String(ts))
        let apikey = URLQueryItem(name: "apikey", value: String(apikey))
        let hash = URLQueryItem(name: "hash", value: String(hash))
        let offset = URLQueryItem(name: "offset", value: String(offset))
        let limit = URLQueryItem(name: "limit", value: String(limit))
        var request = URLRequest(url: url)
        request.url?.append(queryItems: [ts, apikey, hash, offset, limit])
        request.httpMethod = "GET"
        request.timeoutInterval = 60
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        return request
    }
    static func getComics(url: URL, ts: Int = 1, hash: String, apikey: String, offset: Int, limit: Int) -> URLRequest {
        let ts = URLQueryItem(name: "ts", value: String(ts))
        let apikey = URLQueryItem(name: "apikey", value: String(apikey))
        let hash = URLQueryItem(name: "hash", value: String(hash))
        let offset = URLQueryItem(name: "offset", value: String(offset))
        let limit = URLQueryItem(name: "limit", value: String(limit))
        var request = URLRequest(url: url)
        request.url?.append(queryItems: [ts, apikey, hash, offset, limit])
        request.httpMethod = "GET"
        request.timeoutInterval = 60
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        return request
    }
}
