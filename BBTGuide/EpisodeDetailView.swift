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
    
    @Environment(\.dismiss) var dismiss
    
    @Environment(\.colorScheme) var colorScheme
    
    var fillColor: Color {
        if colorScheme == .dark {
            return Color.black
        } else {
            return Color.white
        }
    }
    
    var favoriteColor: Color {
        if detailVM.favorite {
            return Color.yellow
        } else {
            return Color.gray
        }
    }
    
    var watchedColor : Color {
        if detailVM.watched {
            return Color.green
        } else {
            return Color.gray
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
                            HStack {
                                RatingView(rating: $detailVM.score)
                                    .font(.system(size: 30, weight: .bold))
                                Spacer()
                                HStack {
                                    Button {
                                        detailVM.toggleFav()
                                    } label: {
                                        Image(systemName: "star.circle.fill")
                                            .font(.system(size: 40, weight: .bold))
                                    }
                                    .tint(favoriteColor)
                                    .controlSize(.large)
                                    Button {
                                        detailVM.toggleWatched()
                                    } label: {
                                        Image(systemName:"eye.circle.fill")
                                            .font(.system(size: 40, weight: .bold))
                                    }
                                    .tint(watchedColor)
                                    .controlSize(.large)
                                }
                            }
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(10)
                        .background {
                            Rectangle()
                                .fill(fillColor.opacity(0.8))
                        }
                    }
                    .frame(maxWidth: .infinity)
                }
                VStack(alignment: .leading) {
                    VStack (alignment: .leading){
                        Text("Season \(detailVM.episode.season) - Episode \(detailVM.episode.number)")
                            .font(.headline)
                        HStack {
                            Text("Air date: \(detailVM.episode.airdate)")
                            Spacer()
                            Text("Runtinme: \(detailVM.episode.runtime)")
                        }
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
                .background {
                    Rectangle()
                        .fill(.gray.opacity(0.3))
                }
                Spacer()
                VStack(alignment: .leading) {
                    Text("My Notes")
                        .font(.headline)
                        .padding(.bottom, 10)
                    Spacer()
                    TextField("Here is some text for the notes", text: $detailVM.notes, axis: .vertical)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
                .background {
                    Rectangle()
                        .fill(.yellow.opacity(0.3))
                }
                Spacer()
                VStack (alignment: .leading) {
                    Text("Summary")
                        .font(.headline)
                        .padding(.bottom, 10)
                    Text(detailVM.episode.summary)
                }
                .padding()
                .navigationTitle(detailVM.episode.name)
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .confirmationAction) {
                        Button("Save") {
                            episodesVM.updateEpisode(episode: detailVM.saveEpisode(episode: detailVM.episode))
                            dismiss()
                        }
                    }
                }
            }
        }
    }
}

struct EpisodeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            EpisodeDetailView(detailVM: DetailViewModel(episode: .episodeTest))
                .environmentObject(EpisodesViewModel())
        }
    }
}
