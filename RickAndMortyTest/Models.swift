//
//  Models.swift
//  RickAndMortyTest
//
//  Created by Фаддей Гусаров on 8/21/23.
//

import Foundation

struct RickAndMorty: Decodable {
    let info: Info
    let results: [Character]
}

struct Episodes: Decodable {
    let info: Info
    let results: [Episode]
}

struct Locations: Decodable {
    let info: Info
    let results: [Location]
}

struct Info: Decodable {
    let pages: Int
    let next: String?
    let prev: String?
}

struct Character: Decodable {
    let id: Int
    let name: String
    let status: String
    let species: String
    let gender: String
    let origin: Location
    let location: Location
    let image: String
    let episode: [String]
    let url: String
    let created: String
}

struct Location: Decodable {
    let name: String
    let url: String
}

struct Episode: Decodable {
    let name: String
    let date: String
    let episode: String
    let characters: [String]
 
    enum CodingKeys: String, CodingKey {
        case name = "name"
        case date = "air_date"
        case episode = "episode"
        case characters = "characters"
    }
}

