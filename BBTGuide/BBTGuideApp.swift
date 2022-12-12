//
//  BBTGuideApp.swift
//  BBTGuide
//
//  Created by Jesus Sanz on 3/12/22.
//

import SwiftUI

@main
struct BBTGuideApp: App {
    @StateObject var episodesVM = EpisodesViewModel()
    
    var body: some Scene {
        WindowGroup {
            TabController()
                .environmentObject(episodesVM)
        }
    }
}
