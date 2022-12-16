//
//  UserDataViewModel.swift
//  BBTGuide
//
//  Created by Jesus Sanz on 15/12/22.
//

import SwiftUI

final class UserDataViewModel:ObservableObject {
    let persistence = ModelPersistence()
    let episodeVM = EpisodesViewModel()
    
    let episodeData:EpisodeData
    
    @Published var id = 0
    @Published var watched = false
    @Published var favorite = false
    @Published var score = 0
    @Published var notes = ""
    
    
    init(episode:BigBang, episodeData:EpisodeData) {
        self.episodeData = episodeData
        id = episode.id
        watched = episodeData.watched
        favorite = episodeData.favorite
        score = episodeData.score
        notes = episodeData.notes
    }
    
    
    func saveData(episodeData:EpisodeData, episode:BigBang) -> EpisodeData {
        return EpisodeData(id: episode.id, watched: watched, favorite: favorite, score: score, notes: notes)
    }
    
    
}


