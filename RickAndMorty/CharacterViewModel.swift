//
//  CharacterViewModel.swift
//  RickAndMorty
//
//  Created by Nicky Taylor on 8/13/24.
//

import Foundation

@Observable class CharacterViewModel {
    
    var characters = [Character]()
    
    static func mock() -> CharacterViewModel {
        CharacterViewModel()
    }
    
    init() {
        Task {
            do {
                let response = try await NetworkCalls.characters()
                await MainActor.run {
                    self.characters = response.results
                }
            } catch {
                print("Error fetching characters: \(error.localizedDescription)")
            }
        }
    }
    
}
