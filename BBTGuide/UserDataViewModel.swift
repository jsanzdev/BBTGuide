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
    @Published var watched:Bool {
        didSet {
            episodeVM.updateUD(episodeData: saveData(episodeData: episodeData))
        }
    }
    @Published var favorite:Bool {
        didSet {
            episodeVM.updateUD(episodeData: saveData(episodeData: episodeData))
        }
    }
    @Published var score:Int {
        didSet {
            episodeVM.updateUD(episodeData: saveData(episodeData: episodeData))
        }
    }
    @Published var notes:String {
        didSet {
            episodeVM.updateUD(episodeData: saveData(episodeData: episodeData))
        }
    }
    
    init(episode:BigBang, episodeData:EpisodeData) {
        self.episodeData = episodeData
        id = episode.id
        watched = episodeData.watched
        favorite = episodeData.favorite
        score = episodeData.score
        notes = episodeData.notes
    }
    
    
    func saveData(episodeData:EpisodeData) -> EpisodeData {
        return EpisodeData(id: episodeData.id, watched: watched, favorite: favorite, score: score, notes: notes)
    }
    
    
}


