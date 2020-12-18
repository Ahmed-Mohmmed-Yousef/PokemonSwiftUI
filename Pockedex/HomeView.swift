//
//  ContentView.swift
//  Pockedex
//
//  Created by Ahmed on 14/12/2020.
//

import SwiftUI


struct ContentView: View {
    
    @State private var animate = false
    @State private var endSplash = false
    var body: some View {
        ZStack {
            if endSplash {
                TabView {
                    HomeView()
                        .tabItem {
                            Image(systemName: "house.fill")
                            Text("Home")
                        }
                    FavPok()
                        .tabItem {
                            Image(systemName: "heart.fill")
                            Text("Favorate")
                        }
                }
            }
            
            SplashView(animate: $animate)
                .onAppear(perform: animateSplash)
                .opacity(endSplash ? 0 : 1)
        }
    }
    
    func animateSplash() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            withAnimation(Animation.easeOut(duration: 0.5)) {
                animate.toggle()
            }
            
            withAnimation(Animation.easeOut(duration: 0.5)) {
                endSplash.toggle()
            }
        }
    }
}

struct SplashView: View {
    let gradient = Gradient(colors: [.white, .green])
    @Binding var animate: Bool
    
    var body: some View {
        ZStack {
            RadialGradient(gradient: gradient, center: .center, startRadius: 1, endRadius: 100)
                .opacity(animate ? 1 : 0)
        }
    }
    
    
}

struct HomeView: View {
    @ObservedObject var plistVM = PokemonsListViewMode.shared
    
    var layout = [GridItem(.flexible()), GridItem(.flexible())]
    
    init() {
        plistVM.fetchPokemons()
    }
    
    var body: some View {
        if plistVM.pokemonsVM.isEmpty {
            LoadingView()
        } else {
            NavigationView {
                ScrollView {
                    if !plistVM.pokemonsVM.isEmpty{
                        LazyVGrid(columns: layout, spacing: 20) {
                            ForEach(plistVM.pokemonsVM, id: \.id) { pokVM in
                                PokemonCell(pokemonVM: pokVM)
                            }
                        }
                    }
                }
                .navigationBarTitle("Pokemon")
            }.accentColor(.black)
            
            
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
