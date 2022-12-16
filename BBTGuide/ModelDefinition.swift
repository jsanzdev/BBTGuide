//
//  ModelDefinition.swift
//  BBTGuide
//
//  Created by Jesus Sanz on 3/12/22.
//

import Foundation

struct BigBang: Codable, Identifiable, Hashable {
    let id: Int
    let url: URL
    let name: String
    let season, number: Int
    let airdate: String
    let runtime: Int
    let image: String
    let summary: String
}

typealias Episodes = [BigBang]

extension BigBang {
    static let episodeTest = BigBang(id: 2913, url: URL(string: "https://www.tvmaze.com/episodes/2913/the-big-bang-theory-1x01-pilot")!, name: "Pilot", season: 1, number: 1, airdate: "2007-09-24", runtime: 30, image: "12368", summary: "Is a comedy about brilliant physicists, Leonard and Sheldon, who are the kind of \"beautiful minds\" that understand how the universe works. But none of that genius helps them interact with people, especially women. All this begins to change when a free-spirited beauty named Penny moves in next door. Sheldon, Leonard's roommate, is quite content spending his nights playing Klingon Boggle with their socially dysfunctional friends, fellow Cal Tech scientists Wolowitz and Koothrappali. However, Leonard sees in Penny a whole new universe of possibilities... including love.\n")
    
    static let seasonTest = [episodeTest, episodeTest]
}

extension EpisodeData {
    static let episodeDataTest = EpisodeData(id: 2913, watched: false, favorite: false, score: 4, notes: "This is a test to see if it takes this notes :)")
}

struct EpisodeData: Codable {
    let id: Int
    let watched:Bool
    let favorite:Bool
    let score:Int
    let notes:String
}
