//
//  Decoder.swift
//  MarvelTotal
//
//  Created by Yery Castro on 13/3/25.
//

import SwiftUI

func getJSON2<JSON>(request: URLRequest, type: JSON.Type) async throws -> JSON where JSON: Codable {
    let (data, response) = try await URLSession.shared.getData(request: request)
    if response.statusCode == 200 {
        do {
            return try JSONDecoder().decode(type, from: data)
        } catch {
            throw NetworkError.json(error)
        }
    } else {
        throw NetworkError.status(response.statusCode)
    }
}

func postJSON2(request: URLRequest, status: Int = 200) async throws {
    let (_, response) = try await URLSession.shared.getData(request: request)
    if response.statusCode != status {
        throw NetworkError.status(response.statusCode)
    }
}
