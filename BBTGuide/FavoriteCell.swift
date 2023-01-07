//
//  FavoriteCell.swift
//  BBTGuide
//
//  Created by Jesus Sanz on 7/1/23.
//

import SwiftUI

struct FavoriteCell: View {
    @ObservedObject var detailVM:DetailViewModel
    
    @Environment(\.colorScheme) var colorScheme
    var fillColor: Color {
        if colorScheme == .dark {
            return Color.black
        } else {
            return Color.white
        }
    }
    
    var body: some View {
        HStack {
            ZStack(alignment: .bottom) {
                Image(detailVM.episode.image)
                    .resizable()
                    .scaledToFit()
                HStack (){
                    Text("Season \(detailVM.episode.season) - Episode \(detailVM.episode.number)")
                        .bold()
                    Spacer()
                    HStack {
                        RatingViewCell(rating: detailVM.score)
                        if (detailVM.watched) {
                            Image(systemName: "eye.circle.fill")
                        }
                    }
                    .bold()
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(10)
                .background {
                    Rectangle()
                        .fill(fillColor.opacity(0.9))
                }
            }
            .cornerRadius(10)
        }
    }
}

struct FavoriteCell_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteCell(detailVM: DetailViewModel(episode: .episodeTest))
    }
}
