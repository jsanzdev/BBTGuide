//
//  EpisodeCell.swift
//  BBTGuide
//
//  Created by Jesus Sanz on 3/12/22.
//

import SwiftUI

struct EpisodeCell: View {
    let episode:BigBang
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(episode.name)
                    .font(.headline)
                Text("\(episode.runtime)")
            }
        }
    }
}

struct EpisodeCell_Previews: PreviewProvider {
    static var previews: some View {
        EpisodeCell(episode: .episodeTest)
    }
}
