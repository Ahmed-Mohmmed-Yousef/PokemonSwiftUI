//
//  PockedexApp.swift
//  Pockedex
//
//  Created by Ahmed on 14/12/2020.
//

import SwiftUI

@main
struct PockedexApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

struct x: View {
    var body: some View {
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
            
            Spacer()
            
            Image(systemName: "heart.fill")//true ? "heart.fill" : "heart")
                .resizable()
                .frame(width: 25, height: 25)
                .scaledToFit()
                .padding(8)
                .background(Color.black)
                .clipShape(Circle())
                .shadow(radius: 4)
                .foregroundColor(.white)
        }
        .padding(.horizontal)
    }
}
