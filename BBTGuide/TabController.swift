//
//  TabView.swift
//  BBTGuide
//
//  Created by Jesus Sanz on 3/12/22.
//

import SwiftUI

struct TabController: View {
    var body: some View {
        TabView {
            AllEpisodesView()
                .tabItem {
                    Label("Seasons", systemImage: "popcorn.fill")
                }
            FavoritesView()
                .tabItem {
                    Label("Favourites", systemImage: "star")
                }
            SearchView()
                .tabItem {
                    Label("Search", systemImage: "magnifyingglass")
                }
        }
    }
}

struct TabController_Previews: PreviewProvider {
    static var previews: some View {
        TabController()
            .environmentObject(EpisodesViewModel())
    }
}
