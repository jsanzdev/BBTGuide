//
//  FavoritesView.swift
//  BBTGuide
//
//  Created by Jesus Sanz on 3/12/22.
//

import SwiftUI

struct FavoritesView: View {
    @EnvironmentObject var episodesVM:EpisodesViewModel
    
    var body: some View {
        if episodesVM.favoriteEpisodes.isEmpty {
            Text("Add some Episodes to your Favorites!")
                .bold()
        } else {
            NavigationStack {
                ScrollView {
                    ForEach(episodesVM.favoriteEpisodes, id:\.self) { episode in
                        NavigationLink(value: episode) {
                            FavoriteCell(detailVM: DetailViewModel(episode: episode))
                        }
                    }
                }
                .buttonStyle(.plain)
                .padding()
                .navigationTitle("Favorite Episodes")
                .navigationDestination(for: Episode.self) { episode in
                    EpisodeDetailView(detailVM: DetailViewModel(episode: episode))
                }
            }
            
        }
    }
}

struct FavoritesView_Previews: PreviewProvider {
    static var previews: some View {
        FavoritesView()
            .environmentObject(EpisodesViewModel())
    }
}
