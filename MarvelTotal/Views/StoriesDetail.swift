//
//  StoriesDetail.swift
//  MarvelTotal
//
//  Created by Yery Castro on 3/4/25.
//

import SwiftUI

struct StoriesDetail: View {
    @Binding var selectedStories: StoriesComplete?
    var story: StoriesComplete!
    init(selected: Binding<StoriesComplete?>) {
        _selectedStories = selected
        if let story = selected.wrappedValue {
            self.story = story
        }
    }
    var body: some View {
        NavigationStack {
            ZStack {
                ScrollView {
                    MarvelHeaderDetail(url: story.imageURL3, infoName: story.title, infoDescription: story.description ?? "")
                    VStack(alignment: .leading) {
                        ForEach(MarvelCD.allCases) { cell in
                            MarvelCellDetail(icon: cell.icon, labelCell: cell.labelCell, detail: detailsCell(for: cell) ?? "")
                        }
                    }
                    .padding()
                }
                .padding()
                .toolbar {
                    ToolbarItem(placement: .destructiveAction) {
                        Button {
                            selectedStories = nil
                        } label: {
                            Image(systemName: "xmark")
                                .symbolVariant(.fill)
                                .foregroundStyle(.blue)
                        }
                        
                    }
                }
            }
        }
    }
    func detailsCell(for cell: MarvelCD) -> String? {
        switch cell {
        case .comic:
            return story.comics.items.map { "\($0.name)" }.formatted(.list(type: .and))
        case .series:
            return story.series?.items.map { "\($0.name)" }.formatted(.list(type: .and))
        case .story:
            return nil
        case .event:
            return story.events.items.map { "\($0.name)" }.formatted(.list(type: .and))
        case .characters:
            return story.characters.items.map { "\($0.name)" }.formatted(.list(type: .and))
        case .creators:
            return story.creators.items.map { "\($0.name)" }.formatted(.list(type: .and))
        }
    }
}

#Preview {
    NavigationStack {
        StoriesDetail(selected: .constant(.testStories))
            .environment(MarvelVM.preview)
    }
}
