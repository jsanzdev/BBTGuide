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
        ScrollView {
        }
    }
}

struct FavoritesView_Previews: PreviewProvider {
    static var previews: some View {
        FavoritesView()
            .environmentObject(EpisodesViewModel())
    }
}
