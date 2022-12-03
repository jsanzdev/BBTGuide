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
        ScrollView {
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 150))]) {
                ForEach(episodesVM.seasonsSection, id:\.self) { episodes in
                    SeasonCell(season: episodes)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(EpisodesViewModel())
    }
}
