//
//  EpisodesViewModel.swift
//  BBTGuide
//
//  Created by Jesus Sanz on 3/12/22.
//

import SwiftUI

final class EpisodesViewModel:ObservableObject {
    
    
    let persistence = ModelPersistence()
    
    @Published var episodes:[BigBang]
    @Published var search = ""
    
    var orderedEpisodes:[BigBang] {
        return episodes.sorted {
            $0.number < $1.number
        }
    }
    
    var seasonsSection:[[BigBang]] {
        Dictionary(grouping: episodes) { episode in
            episode.season
        }.values.sorted {
            $0.first!.season < $1.first!.season
        }.map { episodes in
            episodes.filter { episode in
                if search.isEmpty {
                    return true
                } else {
                    return episode.name.lowercased().hasPrefix(search.lowercased())
                }
            }.sorted { episode1, episode2 in
                return episode1.number < episode2.number
            }
        }
    }
    
    var seasons:[Int] {
        Array(Set(episodes.map(\.season)))
    }
    
    init() {
        self.episodes = persistence.loadEpisodes()
    }
}
