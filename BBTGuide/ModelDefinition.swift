//
//  ModelDefinition.swift
//  BBTGuide
//
//  Created by Jesus Sanz on 3/12/22.
//

import SwiftUI

struct Episode:Codable, Identifiable, Hashable {
    let id: Int
    let url: URL
    let name: String
    let season, number: Int
    let airdate: String
    let runtime: Int
    let image: String
    let summary: String
    var watched:Bool
    var favorite:Bool
    var score:Int
    var notes:String
}

struct TempEpisode:Codable, Identifiable, Hashable {
    let id: Int
    let url: URL
    let name: String
    let season, number: Int
    let airdate: String
    let runtime: Int
    let image: String
    let summary: String
}

struct WatchedSeasons:Codable {
    var watched:[Int]
}

typealias TempEpisodes = [TempEpisode]

typealias Episodes = [Episode]

extension Episode {
    static let episodeTest = Episode(id: 2913, url: URL(string: "https://www.tvmaze.com/episodes/2913/the-big-bang-theory-1x01-pilot")!, name: "Pilot", season: 1, number: 1, airdate: "2007-09-24", runtime: 30, image: "12368", summary: "Is a comedy about brilliant physicists, Leonard and Sheldon, who are the kind of \"beautiful minds\" that understand how the universe works. But none of that genius helps them interact with people, especially women. All this begins to change when a free-spirited beauty named Penny moves in next door. Sheldon, Leonard's roommate, is quite content spending his nights playing Klingon Boggle with their socially dysfunctional friends, fellow Cal Tech scientists Wolowitz and Koothrappali. However, Leonard sees in Penny a whole new universe of possibilities... including love.\n", watched: true, favorite: false, score: 2, notes: "This is the starter note")
    
    static let seasonTest = [episodeTest, episodeTest]
}
