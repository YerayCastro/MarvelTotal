//
//  PruebaSeriesDetail.swift
//  MarvelTotal
//
//  Created by Yery Castro on 3/4/25.
//

import SwiftUI

struct SeriesDetail: View {
    @Binding var selectedSeries: SeriesComplete?
    var serie: SeriesComplete!
    init(selected: Binding<SeriesComplete?>) {
        _selectedSeries = selected
        if let serie = selected.wrappedValue {
            self.serie = serie
        }
    }
    var body: some View {
        NavigationStack {
            ZStack {
                ScrollView {
                    MarvelHeaderDetail(url: serie.imageURL2, infoName: serie.title ?? "", infoDescription: serie.description ?? "")
                    VStack(alignment: .leading) {
                        ForEach(MarvelCD.allCases) { cell in
                            MarvelCellDetail(icon: cell.icon, labelCell: cell.labelCell, detail: detailsCell(for: cell) ?? "")
                        }
                        ForEach(serie.urls, id: \.url) { marvelURL in
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
                            selectedSeries = nil
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
            return serie.comics.items.map { "\($0.name)" }.formatted(.list(type: .and))
        case .series:
            return nil
        case .story:
            return serie.stories.items.map { "\($0.name)" }.formatted(.list(type: .and))
        case .event:
            return serie.events.items.map { "\($0.name)" }.formatted(.list(type: .and))
        case .characters:
            return serie.characters?.items.map { "\($0.name)" }.formatted(.list(type: .and))
        case .creators:
            return serie.creators?.items.map { "\($0.name) (\($0.role))" }.formatted(.list(type: .and))
        }
    }
}

#Preview {
    NavigationStack {
        SeriesDetail(selected: .constant(.testSeries))
            .environment(MarvelVM.preview)
    }
}
