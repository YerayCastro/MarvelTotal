//
//  URLSession.swift
//  MarvelTotal
//
//  Created by Yery Castro on 13/3/25.
//

import Foundation

extension URLSession {
    func getData(request: URLRequest) async throws -> (Data, HTTPURLResponse) {
        do {
            let (data, response) = try await URLSession.shared.data(for: request)
            guard let httpResponse = response as? HTTPURLResponse else { throw NetworkError.noHTTP }
            return (data, httpResponse)
        } catch {
            throw NetworkError.general(error)
        }
    }
}

