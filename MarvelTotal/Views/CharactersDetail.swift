//
//  PruebaMarvelDetail.swift
//  MarvelTotal
//
//  Created by Yery Castro on 3/4/25.
//

import SwiftUI

struct CharactersDetail: View {
    @Binding var selectedCharacter: CharactersComplete?
    var character: CharactersComplete!
    init(selected: Binding<CharactersComplete?>) {
        _selectedCharacter = selected
        if let character = selected.wrappedValue {
            self.character = character
        }
    }
    var body: some View {
        NavigationStack {
            ZStack {
                ScrollView {
                    MarvelHeaderDetail(url: character.imageURL, infoName: character.name, infoDescription: character.description)
                    
                    VStack(alignment: .leading) {
                        ForEach(MarvelCD.allCases, id: \.self) { cell in
                            MarvelCellDetail(icon: cell.icon, labelCell: cell.labelCell, detail: detailsCell(for: cell) ?? "")
                        }
                        ForEach(character.urls, id: \.url) { marvelURL in
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
                            selectedCharacter = nil
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
            return character.comics.items.map { "\($0.name)" }.formatted(.list(type: .and))
        case .series:
            return character.series.items.map { "\($0.name)" }.formatted(.list(type: .and))
        case .story:
            return character.stories.items.map { "\($0.name)" }.formatted(.list(type: .and))
        case .event:
            return character.events.items.map { "\($0.name)" }.formatted(.list(type: .and))
        case .characters:
            return nil
        case .creators:
            return nil
        }
    }
}

#Preview {
    NavigationStack {
        CharactersDetail(selected: .constant(.testCharacters))
            .environment(MarvelVM.preview)
    }
}

