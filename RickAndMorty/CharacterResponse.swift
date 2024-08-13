//
//  CharacterResponse.swift
//  RickAndMorty
//
//  Created by Nicky Taylor on 8/13/24.
//

import Foundation

struct CharacterResponse: Decodable {
    struct Info: Decodable {
        let count: Int
        let pages: Int
    }
    
    let info: Info
    let results: [Character]
}
