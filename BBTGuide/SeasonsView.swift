//
//  SeasonsView.swift
//  BBTGuide
//
//  Created by Jesus Sanz on 12/12/22.
//

import SwiftUI

struct SeasonsView: View {
    @EnvironmentObject var episodesVM:EpisodesViewModel
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(episodesVM.seasonsSection, id:\.self) { episodes in
                    NavigationLink(value: episodes) {
                        SeasonCell(season: episodes)
                            .swipeActions(edge: .leading, allowsFullSwipe: true) {
                                Button {
                                    
                                } label: {
                                    Image(systemName: "eye.circle.fill")
                                }
                            }
                            .tint(.green)
                    }
                }
            }
            .listStyle(.sidebar)
            .navigationDestination(for: Episodes.self) { episodes in
                SeasonsDetailView(season: episodes)
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
