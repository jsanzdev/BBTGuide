//
//  EpisodesViewModel.swift
//  BBTGuide
//
//  Created by Jesus Sanz on 3/12/22.
//

import SwiftUI

final class EpisodesViewModel:ObservableObject {
    let persistence = ModelPersistence()
    
    @Published var episodes:[Episode] {
        didSet {
            persistence.saveData(episodes: episodes)
        }
    }
    
    @Published var search = ""
    
    @Published var watchedSeasons:WatchedSeasons {
        didSet {
            persistence.saveWatched(watched: watchedSeasons)
        }
    }
    
    var orderedEpisodes:[Episode] {
        return episodes.sorted {
            $0.number < $1.number
        }
    }
    
    var seasonsSection:[[Episode]] {
        Dictionary(grouping: episodes) { episode in
            episode.season
        }.values.sorted {
            $0.first?.season ?? 0 < $1.first?.season ?? 0
        }
    }
    
    var searchSection:[Episode] {
        episodes.filter { episode in
            return searchEpisode(episode: episode.name.lowercased(), searchField: search.lowercased())
        }.sorted { episode1, episode2 in
            return episode1.number < episode2.number
        }
    }
    
    var favoriteEpisodes:[Episode] {
        var favorites:[Episode] = []
        for episode in episodes {
            if episode.favorite {
                favorites.append(episode)
            }
        }
        return favorites
    }
    
    var seasons:[Int] {
        Array(Set(episodes.map(\.season)))
    }
    
    init() {
        self.episodes = persistence.loadData()
        self.watchedSeasons = persistence.loadWatched()
    }
    
    func refresh() {
        episodes = persistence.loadData()
    }
    
    func updateEpisode(episode:Episode) {
        if let index = episodes.firstIndex(where: {$0.id == episode.id }) {
            episodes[index] = episode
        }
    }
    
    func getEpisodeByID(id:Int) -> Episode? {
        episodes.first(where: {$0.id == id })
    }
    
    func updateView(){
            self.objectWillChange.send()
        }
    
    func searchEpisode(episode:String, searchField:String) -> Bool {
        guard !episode.isEmpty, !searchField.isEmpty, let _ = episode.range(of: searchField) else {
            return false
        }
        return true
    }
    
    func seasonWatched(number:Int) -> Bool {
        watchedSeasons.watched.contains(where: { $0 == number })
    }
    
    func toggleWatched(number:Int) {
        if watchedSeasons.watched.contains(where: {$0 == number }) {
            watchedSeasons.watched.removeAll(where: {$0 == number })
        } else {
            watchedSeasons.watched.append(number)
        }
    }
}
