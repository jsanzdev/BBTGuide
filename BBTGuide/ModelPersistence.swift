//
//  ModelPersistence.swift
//  BBTGuide
//
//  Created by Jesus Sanz on 3/12/22.
//

import SwiftUI

extension URL {
    static let episodeDataURL = Bundle.main.url(forResource: "BigBang", withExtension: "json")!
    static let userDataURL = URL.documentsDirectory.appending(component: "userdata").appendingPathExtension("json")
    static let watchedSeasonsURL = URL.documentsDirectory.appending(component: "watchedSeasons").appendingPathExtension("json")
}


final class ModelPersistence {
    func loadTempEpisodes(url:URL = .episodeDataURL) -> [TempEpisode] {
        do {
            let data = try Data(contentsOf: url)
            return try JSONDecoder().decode([TempEpisode].self, from: data)
        } catch {
            print("Error en la carga \(error)")
            return []
        }
    }
    
    func loadData() -> [Episode] {
        if !FileManager.default.fileExists(atPath: URL.userDataURL.path()) {
            createDataFile()
        }
        do {
            let data = try Data(contentsOf: .userDataURL)
            return try JSONDecoder().decode([Episode].self, from: data)
        } catch {
            print("Error loading the user data \(error)")
            return []
        }
    }

    func saveData(episodes: [Episode]) {
        do {
            let encoder = JSONEncoder()
            let data = try encoder.encode(episodes)
            try data.write(to: .userDataURL, options: [.atomic, .completeFileProtection])
        } catch {
            //TODO -> Change this for a proper error
            print("Error saving the user data \(error)")
        }
    }
    
    func createDataFile() {
        let tempEpisodes = loadTempEpisodes()
        var episodes:[Episode] = []
        for tempEpisode in tempEpisodes {
            episodes.append(Episode(id: tempEpisode.id, url: tempEpisode.url, name: tempEpisode.name, season: tempEpisode.season, number: tempEpisode.number, airdate: tempEpisode.airdate, runtime: tempEpisode.runtime, image: tempEpisode.image, summary: tempEpisode.summary, watched: false, favorite: false, score: 0, notes: ""))
        }
        saveData(episodes: episodes)
    }
    
    func loadWatched() -> WatchedSeasons {
        do {
            let data = try Data(contentsOf: .watchedSeasonsURL)
            return try JSONDecoder().decode(WatchedSeasons.self, from: data)
        } catch {
            print("Error en la carga \(error)")
            return WatchedSeasons(watched: [])
        }
    }
    
    func saveWatched(watched:WatchedSeasons) {
        do {
            let encoder = JSONEncoder()
            let data = try encoder.encode(watched)
            try data.write(to: .watchedSeasonsURL, options: [.atomic, .completeFileProtection])
        } catch {
            print("Error saving the watched Seasons data \(error)")
        }
    }
    
}
