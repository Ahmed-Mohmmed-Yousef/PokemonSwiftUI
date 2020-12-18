//
//  PocemonsListViewMode.swift
//  Pockedex
//
//  Created by Ahmed on 14/12/2020.
//

import SwiftUI

class PokemonsListViewMode: ObservableObject {
    @Published var pokemonsVM: [PokemonViewModel] = []
    @Published var favPokemonsVM: [PokemonViewModel] = []
    let baseUrl = "https://pokedex-bb36f.firebaseio.com/pokemon.json"
    
    static let shared = PokemonsListViewMode()
    private init() {
        
    }
    
    func fetchPokemons() {
        guard let url = URL(string: baseUrl) else { return }
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else { return }
            print(data.description)
            guard let pokemons = try? JSONDecoder().decode([Pokemon?].self, from: data) else { return }
            let pokemonsViewModels = pokemons.filter { (pok) -> Bool in pok != nil}.map { (pok) -> PokemonViewModel in
                PokemonViewModel(pokemon: pok!)
            }
            DispatchQueue.main.async {
                self.pokemonsVM = pokemonsViewModels
            }
        }.resume()
    }
    
}
