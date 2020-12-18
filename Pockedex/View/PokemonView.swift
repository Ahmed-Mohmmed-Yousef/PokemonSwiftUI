//
//  PokemonView.swift
//  Pockedex
//
//  Created by Ahmed on 15/12/2020.
//

import SwiftUI
import SDWebImageSwiftUI

struct PokemonView: View {
    @ObservedObject var pokemonVM: PokemonViewModel
    @State private var isShow: Bool = false
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        let screenSize = UIScreen.main.bounds.size
        ZStack {
            ZStack {
                LinearGradient(gradient: Gradient(colors: [ Color(backgroundColor(type: pokemonVM.type)), .white]), startPoint: .top, endPoint: .bottom)
                    .edgesIgnoringSafeArea(.all)
                VStack {
                    HStack {
                        
                        Image(systemName: "chevron.left")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 25, height: 25, alignment: .center)
                            .padding(8)
                            .background(Color.black)
                            .clipShape(Circle())
                            .shadow(radius: 4)
                            .foregroundColor(.white)
                            .onTapGesture {
                                presentationMode.wrappedValue.dismiss()
                            }
                        
                        Spacer()
                        
                        Image(systemName: pokemonVM.pokemon.isFav ? "heart.fill" : "heart")
                            .resizable()
                            .frame(width: 25, height: 25)
                            .scaledToFit()
                            .padding(8)
                            .background(Color.black)
                            .clipShape(Circle())
                            .shadow(radius: 4)
                            .foregroundColor(pokemonVM.pokemon.isFav ? .red : .white)
                            .rotationEffect(Angle.init(degrees: pokemonVM.pokemon.isFav ? 360 : 0))
                            .animation(.easeIn(duration: 0.4))
                            .onTapGesture {
                                pokemonVM.togglIsFav()
                            }
                    }
                    .padding(.horizontal)
                    Spacer()
                }
            }
            VStack {
                
                Text(pokemonVM.name.capitalized)
                    .font(.title)
                    .padding(.top, 40)
                
                Text(pokemonVM.type)
                    .font(.title3).bold()
                    .foregroundColor(.white)
                    .padding(.horizontal, 16)
                    .padding(.vertical, 4)
                    .background(
                        Color(backgroundColor(type: pokemonVM.type))
                            .cornerRadius(15)
                    )
                
                Text(pokemonVM.description)
                    .font(.body)
                    .padding(8)
                
                Text("Stats")
                    .font(.subheadline).bold()
                    .padding(8)
                
                VStack(alignment: .center) {
                    ProgressView(name: "Height", number: pokemonVM.height, color: .orange)
                    ProgressView(name: "Attack", number: pokemonVM.attack, color: .red)
                    ProgressView(name: "Defense", number: pokemonVM.defense, color: .blue)
                    ProgressView(name: "Weight", number: pokemonVM.weight, color: .purple)
                    ProgressView(name: "Total", number: pokemonVM.total, color: .green)
                }
                
                Spacer()
            }
            .frame(width: screenSize.width, height: screenSize.height * 0.75)
            .background(Color.white)
            .cornerRadius(20)
            .offset(y: 120)
            
            WebImage(url: URL(string: pokemonVM.imageUrl))
                .resizable()
                .scaledToFit()
                .frame(width: 150, height: 150)
                .padding([.trailing, .bottom], 4)
                .offset(x: isShow ? 0 : -250 ,y: -250)
                .animation(.easeOut(duration: 0.4))
            
        }
        .navigationBarBackButtonHidden(true)
        .onAppear {
            isShow = true
        }
        .onDisappear {
            isShow = false
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

