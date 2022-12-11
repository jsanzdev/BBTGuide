//
//  ContentView.swift
//  BBTGuide
//
//  Created by Jesus Sanz on 3/12/22.
//

import SwiftUI
import Combine

struct ContentView: View {
    @EnvironmentObject var episodesVM:EpisodesViewModel
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(episodesVM.seasonsSection, id:\.self) { episodes in
                    Section {
                        ForEach(episodes) { episode in
                            NavigationLink(value: episode) {
                                EpisodeCell(episode: episode)
                            }
                        }
                    } header: {
                        HStack {
                            Image("season\(episodes.first!.season)")
                            VStack (alignment: .leading){
                                Text("Season \(episodes.first!.season)")
                                HStack {
                                    Text("Watched ")
                                    Image(systemName: "checkmark.square")
                                }
                            }
                        }
                        
                    }
                }
            }
            .listStyle(.sidebar)
            .navigationDestination(for: BigBang.self) { episode in
                EpisodeDetailView(detailVM: DetailViewModel(episode: episode))
            }
            .navigationTitle("The Big Bang Theory")
            .searchable(text: $episodesVM.search)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(EpisodesViewModel())
    }
}
