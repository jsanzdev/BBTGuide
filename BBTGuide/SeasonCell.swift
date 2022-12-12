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
            HStack() {
                Image("season\(season.first!.season)")
                VStack (alignment: .leading){
                    Text("Season \(season.first!.season)")
                    HStack {
                        Text("Watched ")
                        Image(systemName: "checkmark.square")
                    }
                }
            }
        }
    }
}

struct SeasonCell_Previews: PreviewProvider {
    static var previews: some View {
        SeasonCell(season: [.episodeTest])
    }
}
