//
//  SeasonCell.swift
//  BBTGuide
//
//  Created by Jesus Sanz on 3/12/22.
//

import SwiftUI

struct SeasonCell: View {
    let season:[Episode]
    
    @Environment(\.colorScheme) var colorScheme
    
    var fillColor: Color {
        if colorScheme == .dark {
            return Color.black
        } else {
            return Color.white
        }
    }
    
    var SeasonWatched:Bool {
        let episodeCount = season.count
        var watchedCount = 0
        for episode in season {
            if episode.watched {
                watchedCount += watchedCount
            }
        }
        if episodeCount == watchedCount {
            return true
        } else {
            return false
        }
    }
    
    var body: some View {
        HStack {
            ZStack(alignment: .bottom) {
                Image("season\(season.first!.season)")
                    .resizable()
                    .scaledToFit()
                HStack (){
                    Text("Season \(season.first!.season)")
                        .bold()
                    Spacer()
                    HStack {
                        if (SeasonWatched) {
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

struct SeasonCell_Previews: PreviewProvider {
    static var previews: some View {
        SeasonCell(season: [.episodeTest])
    }
}
