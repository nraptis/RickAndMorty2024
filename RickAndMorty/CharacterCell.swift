//
//  CharacterCell.swift
//  RickAndMorty
//
//  Created by Nicky Taylor on 8/13/24.
//

import SwiftUI

struct CharacterCell: View {
    
    struct Constants {
        
        static let thumbPadding = CGFloat(4.0)
        static let thumbSize = CGFloat(96.0)
        static let thumbShape = RoundedRectangle(cornerRadius: 16.0)
        static let thumbBackgroundColor = Color.white
        static let thumbForegroundColor = Color.gray
        
        static let cellShape = RoundedRectangle(cornerRadius: 20.0)
        static let cellPaddingHorizontal = CGFloat(12.0)
        static let cellBackgroundColor = Color(red: 0.78, green: 0.82, blue: 0.84)
        static let cellForegroundColorName = Color.black
        static let cellForegroundColorLabel = Color(red: 0.225, green: 0.225, blue: 0.265)
        static let cellForegroundColorData = Color(red: 0.135, green: 0.145, blue: 0.185)
        
    }
    
    let character: Character
    var body: some View {
        HStack {
            thumb()
            info()
        }
        .background(Constants.cellShape.foregroundStyle(Constants.cellBackgroundColor))
        .padding(.horizontal, Constants.cellPaddingHorizontal)
    }
    
    func info() -> some View {
        VStack {
            name()
            if let status = character.status {
                pair(label: "Status", value: status)
            }
            if let species = character.species {
                pair(label: "Species", value: species)
            }
            if let gender = character.gender {
                pair(label: "Gender", value: gender)
            }
        }
        .frame(height: Constants.thumbSize)
    }
    
    func pair(label: String, value: String) -> some View {
        HStack {
            Text("\(label):")
                .font(.system(size: 18.0, weight: .regular))
                .foregroundStyle(Constants.cellForegroundColorLabel)
            Text("\(value)")
                .font(.system(size: 18.0, weight: .semibold))
                .foregroundStyle(Constants.cellForegroundColorData)
            Spacer()
        }
    }
    
    func name() -> some View {
        HStack {
            Text(character.name)
                .font(.system(size: 24.0, weight: .semibold))
                .foregroundStyle(Constants.cellForegroundColorName)
            Spacer()
        }
    }
    
    func thumb() -> some View {
        ZStack {
            
            if let imageURL = character.image, let url = URL(string: imageURL) {
                AsyncImage(url: url) { phase in
                    switch phase {
                    case .success(let image):
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: Constants.thumbSize, height: Constants.thumbSize)
                            .clipShape(Constants.thumbShape)
                    case .failure:
                        error()
                    default:
                        loading()
                    }
                    
                }
                
            } else {
                error()
            }
        }
        .padding(.all, Constants.thumbPadding)
    }
    
    func error() -> some View {
        ZStack {
            Image(systemName: "photo")
                .font(.system(size: 44.0))
        }
        .frame(width: Constants.thumbSize, height: Constants.thumbSize)
        .background(Constants.thumbShape.foregroundStyle(Constants.thumbBackgroundColor))
    }
    
    func loading() -> some View {
        ZStack {
            ProgressView()
                .tint(Constants.thumbForegroundColor)
        }
        .frame(width: Constants.thumbSize, height: Constants.thumbSize)
        .background(Constants.thumbShape.foregroundStyle(Constants.thumbBackgroundColor))
    }
    
}

#Preview {
    CharacterCell(character: Character.mock())
}
