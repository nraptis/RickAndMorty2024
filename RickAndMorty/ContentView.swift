//
//  ContentView.swift
//  RickAndMorty
//
//  Created by Nicky Taylor on 8/13/24.
//

import SwiftUI

struct ContentView: View {
    
    @Environment(CharacterViewModel.self) var characterViewModel: CharacterViewModel
    
    var body: some View {
        ScrollView {
            LazyVStack {
                ForEach(characterViewModel.characters) { character in
                    CharacterCell(character: character)
                }
            }
        }
    }
}

#Preview {
    ContentView()
        .environment(CharacterViewModel.mock())
}
