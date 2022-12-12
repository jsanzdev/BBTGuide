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
            SeasonsView()
                .tabItem {
                    Label("Seasons", systemImage: "popcorn.fill")
                }
            FavoritesView()
                .tabItem {
                    Label("Favourites", systemImage: "star")
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
