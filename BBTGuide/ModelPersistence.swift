//
//  ModelPersistence.swift
//  BBTGuide
//
//  Created by Jesus Sanz on 3/12/22.
//

import SwiftUI

extension URL {
    static let episodeDataURL = Bundle.main.url(forResource: "BigBang", withExtension: "json")!
}


final class ModelPersistence {
    func loadEpisodes(url:URL = .episodeDataURL) -> [BigBang] {
        let urlData = URL.episodeDataURL
        do {
            let data = try Data(contentsOf: urlData)
            return try JSONDecoder().decode([BigBang].self, from: data)
        } catch {
            print("Error en la carga \(error)")
            return []
        }
    }
    
    
    func saveFavorites(episodes:[BigBang]) {
        // here we will save the favorite eposidoes.
    }
}
