//
//  FavPok.swift
//  Pockedex
//
//  Created by Ahmed on 18/12/2020.
//

import SwiftUI

struct FavPok: View {
    @ObservedObject var plistVM = PokemonsListViewMode.shared
    var layout = [GridItem(.flexible()), GridItem(.flexible())]
    @State var isShow: Bool = false
    
    var body: some View {
        if plistVM.favPokemonsVM.isEmpty {
            Image(systemName: "heart.fill")
                .resizable()
                .frame(width: isShow ? 45 : 25, height: isShow ? 45 : 25, alignment: .center)
                .animation(Animation.default.repeatForever())
                .foregroundColor(.red)
                .opacity(isShow ? 1 : 0)
                .animation(.default)
                .onAppear {
                    isShow = true
                }
                .onDisappear{
                    isShow = false
                }
        } else {
                        NavigationView {
                            ScrollView {
                                LazyVGrid(columns: layout, spacing: 20) {
                                    ForEach(plistVM.favPokemonsVM, id: \.id) { pokVM in
                                        PokemonCell(pokemonVM: pokVM)
                                    }
                                }
                            }
                            .navigationBarTitle("Pokemon")
                        }.accentColor(.black)
//            Text("\(plistVM.favPokemonsVM.count)")
        }
        
        
    }
}

struct FavPok_Previews: PreviewProvider {
    static var previews: some View {
        FavPok()
    }
}
