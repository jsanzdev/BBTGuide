//
//  SearchVIew.swift
//  BBTGuide
//
//  Created by Jesus Sanz on 7/1/23.
//

import SwiftUI

struct SearchView: View {
    @EnvironmentObject var episodesVM:EpisodesViewModel
    @State var path = NavigationPath()
    
    var body: some View {
        NavigationStack(path: $path) {
            if episodesVM.search.isEmpty {
                Text("Search for an Episode.")
                    .bold()
            } else {
                List {
                    ForEach(episodesVM.searchSection, id:\.self) { episode in
                        NavigationLink(value: episode) {
                            SearchEpisodeCell(detailVM: DetailViewModel(episode: episode))
                        }
                    }
                }
                .listStyle(.sidebar)
                .navigationDestination(for: Episode.self) { episode in
                    EpisodeDetailView(detailVM: DetailViewModel(episode: episode))
                }
                .navigationTitle("Search")
            }
        }
        .searchable(text: $episodesVM.search)
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
            .environmentObject(EpisodesViewModel())
    }
}
