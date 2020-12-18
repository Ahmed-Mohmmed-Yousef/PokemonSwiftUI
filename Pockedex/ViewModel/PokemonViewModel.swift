//
//  PokemonViewModel.swift
//  Pockedex
//
//  Created by Ahmed on 14/12/2020.
//

import SwiftUI

class PokemonViewModel: ObservableObject {
    @Published private(set) var pokemon: Pokemon
    
    var id: Int {
        pokemon.id
    }
    
    var name: String {
        pokemon.name
    }
    
    var type: String {
        pokemon.type
    }
    
    var imageUrl: String {
        pokemon.imageUrl
    }
    
    var description: String {
        pokemon.description
    }
    
    var height: Int {
        pokemon.height
    }
    
    var attack: Int {
        pokemon.attack
    }
    
    var defense: Int {
        pokemon.defense
    }
    
    var weight: Int {
        pokemon.weight
    }
    
    var total: Int {
        (attack + defense + weight) / 3
    }
    
    var isFav: Bool {
        pokemon.isFav
    }

    init(pokemon: Pokemon) {
        self.pokemon = pokemon
    }

    func togglIsFav() {
        if isFav {
            pokemon.isFav = false
            PokemonsListViewMode.shared.favPokemonsVM.removeAll(where: {$0.id == id})
        } else {
            pokemon.isFav = true
            PokemonsListViewMode.shared.favPokemonsVM.append(self)
        }
    }


    
}

