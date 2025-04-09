//
//  PruebaComicsDetail.swift
//  MarvelTotal
//
//  Created by Yery Castro on 3/4/25.
//

import SwiftUI

struct ComicsDetail: View {
    @Binding var selectedComics: ComicsComplete?
    var comic: ComicsComplete!
    init(selected: Binding<ComicsComplete?>) {
        _selectedComics = selected
        if let comic = selected.wrappedValue {
            self.comic = comic
        }
    }
    var body: some View {
        NavigationStack {
            ZStack {
                ScrollView {
                    MarvelHeaderDetail(url: comic.imageURL3, infoName: comic.title, infoDescription: comic.description ?? "Dont have description")
                    VStack(alignment: .leading) {
                        ForEach(MarvelCD.allCases) { cell in
                            MarvelCellDetail(icon: cell.icon, labelCell: cell.labelCell, detail: detailsCell(for: cell) ?? "")
                            
                        }
                        ForEach(comic.urls, id: \.url) { marvelURL in
                            if let url = URL(string: marvelURL.url) {
                                Link(destination: url) {
                                    Label {
                                        Text(marvelURL.type.rawValue.capitalized)
                                    } icon: {
                                        Image(systemName: "safari")
                                    }
                                    .font(.callout)
                                    .foregroundColor(.blue)
                                }
                                .padding(.vertical, 2)
                            }
                        }
                    }
                    .padding()
                }
                .padding()
                .toolbar {
                    ToolbarItem(placement: .destructiveAction) {
                        Button {
                            selectedComics = nil
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
            return nil
        case .series:
            return nil
        case .story:
            return comic.stories.items.map { "\($0.name)" }.formatted(.list(type: .and))
        case .event:
            return comic.events.items.map { "\($0.name)" }.formatted(.list(type: .and))
        case .characters:
            return comic.characters.items.map { "\($0.name)" }.formatted(.list(type: .and))
        case .creators:
            return comic.creators.items.map { "\($0.name)" }.formatted(.list(type: .and))
        }
    }
}

#Preview {
    NavigationStack {
        ComicsDetail(selected: .constant(.testComics))
            .environment(MarvelVM.preview)
    }
}
