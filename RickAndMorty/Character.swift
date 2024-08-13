//
//  Character.swift
//  RickAndMorty
//
//  Created by Nicky Taylor on 8/13/24.
//

import Foundation

struct Character: Decodable, Identifiable {
    let id: Int
    let name: String
    let status: String?
    let species: String?
    let gender: String?
    let image: String?
    
    static func mock() -> Character {
        Character(id: 1,
                  name: "Rick Sanchez",
                  status: "Alive",
                  species: "Human",
                  gender: "Male",
                  image: "https://rickandmortyapi.com/api/character/avatar/1.jpeg")
    }
    
}
