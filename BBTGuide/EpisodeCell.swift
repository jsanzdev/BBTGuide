//
//  EpisodeCell.swift
//  BBTGuide
//
//  Created by Jesus Sanz on 3/12/22.
//

import SwiftUI

struct EpisodeCell: View {
    @ObservedObject var detailVM:DetailViewModel
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                HStack {
                    Text(detailVM.episode.name)
                        .font(.headline)
                    Spacer()
                    RatingViewCell(rating: detailVM.score)
                }
                . padding(.bottom, 10)
                HStack {
                    VStack (alignment: .leading) {
                        Text("Runtime: \(detailVM.episode.runtime)")
                        Text("Air date: \(detailVM.episode.airdate)")
                    }
                    .font(.caption)
                    Spacer()
                    if (detailVM.watched) {
                        Image(systemName: "eye.circle.fill")
                    }
                    if (detailVM.favorite) {
                        Image(systemName: "star.circle.fill")
                    }
                }
            }
        }
    }
}

struct EpisodeCell_Previews: PreviewProvider {
    static var previews: some View {
        EpisodeCell(detailVM: DetailViewModel(episode: .episodeTest))
    }
}
