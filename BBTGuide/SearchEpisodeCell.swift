//
//  SearchEpisodeCell.swift
//  BBTGuide
//
//  Created by Jesus Sanz on 7/1/23.
//

import SwiftUI

struct SearchEpisodeCell: View {
    @ObservedObject var detailVM:DetailViewModel
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                HStack {
                    Text(detailVM.episode.name)
                        .font(.headline)
                }
                Text("Season: \(detailVM.episode.season) - Episode \(detailVM.episode.number)")
                    .font(.caption)
                    .padding(.bottom, 10)
                Text(detailVM.episode.summary)
                    .lineLimit(3)
                    .font(.caption)
                    .padding(.bottom, 10)
                HStack {
                    VStack (alignment: .leading) {
                        Text("Runtime: \(detailVM.episode.runtime)")
                        Text("Air date: \(detailVM.episode.airdate)")
                    }
                    .font(.caption)
                    Spacer()
                    RatingViewCell(rating: detailVM.score)
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

struct SearchEpisodeCell_Previews: PreviewProvider {
    static var previews: some View {
        SearchEpisodeCell(detailVM: DetailViewModel(episode: .episodeTest))
    }
}
