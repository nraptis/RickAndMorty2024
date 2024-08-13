//
//  RickAndMortyApp.swift
//  RickAndMorty
//
//  Created by Nicky Taylor on 8/13/24.
//

import SwiftUI

@main
struct RickAndMortyApp: App {
    
    let characterViewModel = CharacterViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(characterViewModel)
        }
    }
}
