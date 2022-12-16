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
}


final class ModelPersistence {
    func loadEpisodes(url:URL = .episodeDataURL) -> [BigBang] {
        do {
            let data = try Data(contentsOf: url)
            return try JSONDecoder().decode([BigBang].self, from: data)
        } catch {
            print("Error en la carga \(error)")
            return []
        }
    }
    
    func loadData() -> [EpisodeData] {
        do {
            let data = try Data(contentsOf: .userDataURL)
            return try JSONDecoder().decode([EpisodeData].self, from: data)
        } catch {
            print("Error loading the user data \(error)")
            return []
        }
    }

    func saveData(userData: [EpisodeData]) {
        do {
            let encoder = JSONEncoder()
            let data = try encoder.encode(userData)
            try data.write(to: .userDataURL, options: [.atomic, .completeFileProtection])
        } catch {
            //TODO -> Change this for a proper error
            print("Error saving the user data \(error)")
        }
    }
    
}
