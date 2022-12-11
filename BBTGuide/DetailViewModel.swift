//
//  DetailViewModel.swift
//  BBTGuide
//
//  Created by Jesus Sanz on 3/12/22.
//

import SwiftUI

final class DetailViewModel:ObservableObject {
    let persistence = ModelPersistence()
    
    let episode:BigBang
    
    @Published var name = ""
    @Published var season = 0
    @Published var airdate = ""
    @Published var runtime = 0
    @Published var summary = ""
    
    
    init(episode:BigBang) {
        self.episode = episode
        name = episode.name
        season = episode.season
        airdate = episode.airdate
        runtime = episode.runtime
        summary = episode.summary
    }
}
