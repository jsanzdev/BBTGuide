//
//  SeasonsDetailView.swift
//  BBTGuide
//
//  Created by Jesus Sanz on 12/12/22.
//

import SwiftUI

struct SeasonsDetailView: View {
    @EnvironmentObject var episodesVM:EpisodesViewModel
    
    let season:[BigBang]
    
    var body: some View {
        List {
            ForEach(season, id:\.self) { episode in
                NavigationLink(value: episode) {
                    EpisodeCell(episode: episode)
                }
            }
        }
        .listStyle(.sidebar)
        .navigationDestination(for: BigBang.self) { episode in
            EpisodeDetailView(detailVM: DetailViewModel(episode: episode), dataVM: UserDataViewModel(episode: episode, episodeData: episodesVM.getDataByID(id: episode.id) ?? EpisodeData(id: episode.id, watched: false, favorite: false, score: 0, notes: "")))
        }
        .navigationTitle("Season \(season.first!.season)")
        .searchable(text: $episodesVM.search)
    }
    
}

struct SeasonsDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            SeasonsDetailView(season: [.episodeTest])
                .environmentObject(EpisodesViewModel())
        }
    }
}
