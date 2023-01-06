//
//  SeasonsDetailView.swift
//  BBTGuide
//
//  Created by Jesus Sanz on 12/12/22.
//

import SwiftUI

struct SeasonsDetailView: View {
    @EnvironmentObject var episodesVM:EpisodesViewModel
    
    let season:[Episode]
    
    var body: some View {
        List {
            ForEach(season, id:\.self) { episode in
                NavigationLink(value: episode) {
                    EpisodeCell(detailVM: DetailViewModel(episode: episode))
                        .swipeActions {
                            Button {
                                DetailViewModel(episode: episode).watched.toggle()
                            } label: {
                                Image(systemName: "eye.circle.fill")
                            }
                        }
                        .tint(.green)
                        .swipeActions(edge: .leading, allowsFullSwipe: true) {
                            Button {
                                DetailViewModel(episode: episode).favorite.toggle()
                                
                            } label: {
                                Image(systemName: "star.circle.fill")
                            }
                        }
                        .tint(.yellow)
                }
            }
            }
            .listStyle(.sidebar)
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
