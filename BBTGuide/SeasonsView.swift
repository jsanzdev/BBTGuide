//
//  SeasonsView.swift
//  BBTGuide
//
//  Created by Jesus Sanz on 12/12/22.
//

import SwiftUI

struct SeasonsView: View {
    @EnvironmentObject var episodesVM:EpisodesViewModel
    @State var path = NavigationPath()
    
    var body: some View {
        NavigationStack(path: $path) {
            List {
                ForEach(episodesVM.seasonsSection, id:\.self) { episodes in
                    NavigationLink(value: episodes) {
                        SeasonCell(season: episodes)
                    }
                }
            }
            .listStyle(.sidebar)
            .navigationDestination(for: Episodes.self) { episodes in
                SeasonsDetailView(season: episodes)
            }
            .navigationDestination(for: Episode.self) { episode in
                EpisodeDetailView(detailVM: DetailViewModel(episode: episode))
            }
            .navigationTitle("The Big Bang Theory")
            .searchable(text: $episodesVM.search)
        }
    }
}

struct SeasonsView_Previews: PreviewProvider {
    static var previews: some View {
        SeasonsView()
            .environmentObject(EpisodesViewModel())
    }
}
