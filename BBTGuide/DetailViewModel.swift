//
//  DetailViewModel.swift
//  BBTGuide
//
//  Created by Jesus Sanz on 3/12/22.
//

import SwiftUI

final class DetailViewModel:ObservableObject {
    let persistence = ModelPersistence()
    let episodesVM = EpisodesViewModel()
    
    let episode:Episode
    
    
    @Published var watched = false
    @Published var favorite = false
    @Published var score = 0
    @Published var notes = ""
    
    init(episode:Episode) {
        self.episode = episode
        watched = episode.watched
        favorite = episode.favorite
        score = episode.score
        notes = episode.notes
        
    }
    
    func toggleFav() {
        if favorite {
            favorite = false
        } else {
            favorite = true
        }
    }
    
    func toggleWatched() {
        if watched {
            watched = false
        } else {
            watched = true
        }
    }
    
    func saveEpisode(episode:Episode) -> Episode {
        return Episode(id: episode.id, url: episode.url, name: episode.name, season: episode.season, number: episode.number, airdate: episode.airdate, runtime: episode.runtime, image: episode.image, summary: episode.summary, watched: watched, favorite: favorite, score: score, notes: notes)
    }
}
