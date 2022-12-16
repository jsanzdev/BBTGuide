//
//  DetailView.swift
//  BBTGuide
//
//  Created by Jesus Sanz on 3/12/22.
//

import SwiftUI

struct EpisodeDetailView: View {
    @EnvironmentObject var episodesVM:EpisodesViewModel
    @ObservedObject var detailVM:DetailViewModel
    @ObservedObject var dataVM:UserDataViewModel
    
    @Environment(\.colorScheme) var colorScheme

    var fillColor: Color {
        if colorScheme == .dark {
            return Color.black
        } else {
            return Color.white
        }
    }
    
    var body: some View {
        ZStack {
            ScrollView {
                VStack {
                    ZStack (alignment: .bottom) {
                        Image(detailVM.episode.image)
                            .resizable()
                            .scaledToFill()
                        VStack (alignment: .leading){
                            Text(detailVM.name)
                                .font(.title)
                                .bold()
                            Text("Season \(detailVM.season)")
                                .font(.headline)
                            HStack {
                                Text("Air date: \(detailVM.airdate)")
                                Spacer()
                                Text("Runtinme: \(detailVM.runtime)")
                            }
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(10)
                        .background {
                            Rectangle()
                                .fill(fillColor.opacity(0.5))
                        }
                    }
                    .frame(maxWidth: .infinity)
                }
                Spacer()
                VStack (alignment: .leading) {
                    Text("Summary")
                        .font(.headline)
                        .padding(.bottom, 10)
                    Text(detailVM.summary)
                }
                .padding()
                Spacer()
                VStack(alignment: .leading) {
                    HStack {
                        Text("Notes")
                            .font(.headline)
                        .padding(.bottom, 10)
                        Spacer()
                        Button("Save") {
                            episodesVM.updateUD(episodeData: dataVM.saveData(episodeData: dataVM.episodeData, episode: detailVM.episode))
                        }
                    }
                    TextField("Here is some text for the notes", text: $dataVM.notes, axis: .vertical)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
                .background {
                    Rectangle()
                        .fill(.yellow.opacity(0.3))
                }
            }
        }
    }
}

struct EpisodeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            EpisodeDetailView(detailVM: DetailViewModel(episode: .episodeTest), dataVM: UserDataViewModel(episode: .episodeTest, episodeData: .episodeDataTest))
                .environmentObject(EpisodesViewModel())
        }
    }
}
