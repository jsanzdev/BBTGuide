//
//  DetailView.swift
//  BBTGuide
//
//  Created by Jesus Sanz on 3/12/22.
//

import SwiftUI

struct EpisodeDetailView: View {
    @EnvironmentObject var episodesVM:EpisodesViewModel
    @Environment(\.scenePhase) private var scenePhase
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
    
    var favoriteColor: Color {
        if dataVM.favorite {
            return Color.yellow
        } else {
            return Color.gray
        }
    }
    
    var watchedColor : Color {
        if dataVM.watched {
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
                                RatingView(rating: $dataVM.score)
                                    .font(.system(size: 30, weight: .bold))
                                Spacer()
                                HStack {
                                    Button {
                                        
                                    } label: {
                                        Image(systemName: "star.circle.fill")
                                            .font(.system(size: 40, weight: .bold))
                                    }
                                    .tint(favoriteColor)
                                    .controlSize(.large)
                                    Button {
                                        
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
                        Text("Season \(detailVM.season)")
                            .font(.headline)
                        HStack {
                            Text("Air date: \(detailVM.airdate)")
                            Spacer()
                            Text("Runtinme: \(detailVM.runtime)")
                        }
                    }
                    .background{
                        Rectangle()
                            .fill(fillColor.opacity(0.8))
                    }
                    Spacer()
                    HStack {
                        Text("Notes")
                            .font(.headline)
                        .padding(.bottom, 10)
                        Spacer()
                        
                    }
                    TextField("Here is some text for the notes", text: $dataVM.notes, axis: .vertical)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
//                .background {
//                    Rectangle()
//                        .fill(.yellow.opacity(0.1))
//                }
                Spacer()
                VStack (alignment: .leading) {
                    Text("Summary")
                        .font(.headline)
                        .padding(.bottom, 10)
                    Text(detailVM.summary)
                }
                .padding()
                .navigationTitle(detailVM.name)
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .confirmationAction) {
                        Button("Save") {
                            episodesVM.updateUD(episodeData: dataVM.saveData(episodeData: dataVM.episodeData))
                        }
                    }
                }
            }
        }
        .onChange(of: scenePhase) { phase in
            if phase == .inactive { episodesVM.updateUD(episodeData: dataVM.saveData(episodeData: dataVM.episodeData)) }
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
