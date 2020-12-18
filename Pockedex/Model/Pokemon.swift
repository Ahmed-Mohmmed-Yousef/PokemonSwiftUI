//
//  Pokemon.swift
//  Pockedex
//
//  Created by Ahmed on 14/12/2020.
//

import Foundation

struct Pokemon : Codable, Identifiable{
    let id: Int
    let name: String
    let imageUrl: String
    let type: String
    let description: String
    let height: Int
    let attack: Int
    let defense: Int
    let weight: Int
    
    var isFav: Bool = false
    
    enum CodingKeys: String, CodingKey {
        case attack, defense
        case  description
        case height, id
        case imageUrl
        case name, type, weight
    }
    
    
}

var favsPoks: [Pokemon] = []

