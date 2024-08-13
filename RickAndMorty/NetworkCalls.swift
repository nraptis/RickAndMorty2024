//
//  NetworkCalls.swift
//  RickAndMorty
//
//  Created by Nicky Taylor on 8/13/24.
//

import Foundation

struct NetworkCalls {
    
    static func characters(page: Int = 1) async throws -> CharacterResponse {
        let urlString = "https://rickandmortyapi.com/api/character?page=\(page)"
        guard let url = URL(string: urlString) else {
            throw URLError.init(.badURL)
        }
        let (data, _) = try await URLSession.shared.data(from: url)
        let decoder = JSONDecoder()
        let response = try decoder.decode(CharacterResponse.self, from: data)
        return response
    }
    
}
