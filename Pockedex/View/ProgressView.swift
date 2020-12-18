//
//  PokemonDetailView.swift
//  Pockedex
//
//  Created by Ahmed on 15/12/2020.
//

import SwiftUI

struct ProgressView: View {
    let name: String
    let number: Int
    let color: Color
    
    @State private var isShow = false
    
    var body: some View {
        HStack(spacing: 20) {
            Text(name)
                .font(.subheadline).bold()
                .frame(width: 60)
                .foregroundColor(Color(UIColor.gray))
            Text("\(number)")
                .font(.subheadline)
                .frame(width: 50)
            
                
            ZStack(alignment: .leading) {
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(Color(UIColor.lightGray).opacity(0.4))
                    .frame(width: 200, height: 20)
                RoundedRectangle(cornerRadius: 10)
                    .frame(width: (isShow ? CGFloat(number) : 0).truncatingRemainder(dividingBy: 200), height: 18)
                    .animation(.easeIn(duration: 0.5))
                    .foregroundColor(color)
                    
            }
        }
        .onAppear {
            isShow = true
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

