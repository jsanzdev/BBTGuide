//
//  SeasonCell.swift
//  BBTGuide
//
//  Created by Jesus Sanz on 3/12/22.
//

import SwiftUI

struct SeasonCell: View {
    let season:[BigBang]
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Image("season\(season.first!.number)")
                Text("Season \(season.first!.number)")
                    .font(.headline)
            }
        }
    }
}

struct SeasonCell_Previews: PreviewProvider {
    static var previews: some View {
        SeasonCell(season: [.episodeTest])
    }
}
