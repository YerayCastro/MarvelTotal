//
//  PruebaMarvel.swift
//  MarvelTotal
//
//  Created by Yery Castro on 3/4/25.
//

import SwiftUI

struct MarvelMain: View {
    @Environment(MarvelVM.self) var vm
    @State var selectedCharacter: CharactersComplete?
    @State var selectedSerie: SeriesComplete?
    @State var selectedStory: StoriesComplete?
    @State var selectedEvent: EventsComplete?
    @State var selectedComic: ComicsComplete?
    var mainScroll: some View {
        NavigationStack {
            ScrollView {
                Text("Marvel Total")
                    .font(.largeTitle)
                    .bold()
                    .foregroundStyle(.red.gradient)
                CharactersGrid(selectedCharacter: $selectedCharacter)
                ComicsGrid(selectedComic: $selectedComic)
                SeriesGrid(selectedSerie: $selectedSerie)
                StoriesGrid(selectedStory: $selectedStory)
                EventsGrid(selectedEvent: $selectedEvent)
            }
        }
        .padding()
    }
    var body: some View {
        ZStack {
            mainScroll
                .opacity(selectedCharacter == nil ? 1.0 : 0.0)
                .opacity(selectedComic == nil ? 1.0 : 0.0)
                .opacity(selectedSerie == nil ? 1.0 : 0.0)
                .opacity(selectedStory == nil ? 1.0 : 0.0)
                .opacity(selectedEvent == nil ? 1.0 : 0.0)
            if selectedCharacter != nil {
                CharactersDetail(selected: $selectedCharacter)
            }
            if selectedComic != nil {
                ComicsDetail(selected: $selectedComic)
            }
            if selectedSerie != nil {
                SeriesDetail(selected: $selectedSerie)
            }
            if selectedStory != nil {
                StoriesDetail(selected: $selectedStory)
            }
            if selectedEvent != nil {
                EventsDetail(selected: $selectedEvent)
            }
        }
    }
}

#Preview {
    NavigationStack {
        MarvelMain()
            .environment(MarvelVM.preview)
    }
}

