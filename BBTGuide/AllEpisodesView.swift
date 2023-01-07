//
//  AllEpisodesView.swift
//  BBTGuide
//
//  Created by Jesus Sanz on 6/1/23.
//

import SwiftUI

struct AllEpisodesView: View {
    @EnvironmentObject var episodesVM:EpisodesViewModel
    @State var path = NavigationPath()
    
    var body: some View {
        NavigationStack(path: $path) {
            List {
                ForEach(episodesVM.seasonsSection, id:\.self) { episodes in
                    DisclosureGroup {
                        ForEach(episodes) { episode in
                            NavigationLink(value: episode) {
                                EpisodeCell(detailVM: DetailViewModel(episode: episode))
                            }
                        }
                    } label: {
                        SeasonCell(season: episodes)
                    }
                    .swipeActions(edge: .leading, allowsFullSwipe: true) {
                        Button {
                            episodesVM.toggleWatched(number: episodes.first!.season)
                        } label: {
                            Image(systemName: "eye.circle.fill")
                        }
                    }
                    .tint(episodesVM.seasonWatched(number: episodes.first!.season) ? .red: .green)
                }
               
            }
            .listStyle(.sidebar)
            .navigationDestination(for: Episode.self) { episode in
                EpisodeDetailView(detailVM: DetailViewModel(episode: episode))
            }
            .navigationTitle("The Big Bang Theory")
        }
    }
}

struct AllEpisodesView_Previews: PreviewProvider {
    static var previews: some View {
        AllEpisodesView()
            .environmentObject(EpisodesViewModel())
    }
}
