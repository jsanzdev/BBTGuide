//
//  EpisodeCell.swift
//  BBTGuide
//
//  Created by Jesus Sanz on 3/12/22.
//

import SwiftUI

struct EpisodeCell: View {
    
    let episode:BigBang
    let episodeData:EpisodeData
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                HStack {
                    Text(episode.name)
                        .font(.headline)
                    Spacer()
                    RatingViewCell(rating: episodeData.score)
                }
                . padding(.bottom, 10)
                HStack {
                    VStack (alignment: .leading) {
                        Text("Runtime: \(episode.runtime)")
                        Text("Air date: \(episode.airdate)")
                    }
                    .font(.caption)
                    Spacer()
                    Image(systemName: "eye.circle.fill")
                    Image(systemName: "star.circle.fill")
                }
            }
        }
    }
}

struct EpisodeCell_Previews: PreviewProvider {
    static var previews: some View {
        EpisodeCell(episode: .episodeTest, episodeData: .episodeDataTest)
    }
}
