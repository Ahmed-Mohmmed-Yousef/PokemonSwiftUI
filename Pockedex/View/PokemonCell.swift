//
//  PokemonCell.swift
//  Pockedex
//
//  Created by Ahmed on 14/12/2020.
//

import SwiftUI
import SDWebImageSwiftUI

struct PokemonCell: View {
    init(pokemonVM: PokemonViewModel) {
        self.pokemonVM = pokemonVM
        print(pokemonVM.name)
    }
    
    let pokemonVM: PokemonViewModel
    @State var isAnimating: Bool = false
    var body: some View {
        NavigationLink(destination: PokemonView(pokemonVM: pokemonVM)) {
            ZStack {
                VStack(alignment: .leading) {
                    Text(pokemonVM.name)
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding([.top, .leading], 8)
                    HStack {
                        Text(pokemonVM.type)
                            .font(.subheadline).bold()
                            .foregroundColor(.white)
                            .padding(.horizontal, 16)
                            .padding(.vertical, 8)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .foregroundColor(Color.white.opacity(0.25))
                            )
                            .frame(width: 100, height: 24)
                        
                        
                        WebImage(url: URL(string: pokemonVM.imageUrl), isAnimating: $isAnimating)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 68, height: 68)
                            .padding([.trailing, .bottom], 4)
                    }
                }
                
            }
            .background(Color(backgroundColor(type: pokemonVM.type)))
            .cornerRadius(10)
            .shadow(color: Color(backgroundColor(type: pokemonVM.type)), radius: 10, x: 0.0, y: 0.0)
            
        }
        
        
    }
    
    func backgroundColor(type: String) -> UIColor {
        switch type {
        case "poison":
            return .systemGreen
        case "fire":
            return .systemRed
        case "water":
            return .systemTeal
        case "electric":
            return .systemYellow
        case "psychic":
            return .systemPurple
        case "normal":
            return .systemOrange
        case "flying":
            return .systemBlue
        case "ground":
            return .systemGray
        case "fairy":
            return .systemGray
        default:
            return .orange
        }
    }
}

