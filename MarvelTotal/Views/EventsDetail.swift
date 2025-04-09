//
//  PruebaEventsDetail.swift
//  MarvelTotal
//
//  Created by Yery Castro on 3/4/25.
//

import SwiftUI

struct EventsDetail: View {
    @Binding var selectedEvents: EventsComplete?
    var event: EventsComplete!
    init(selected: Binding<EventsComplete?>) {
        _selectedEvents = selected
        if let event = selected.wrappedValue {
            self.event = event
        }
    }
    var body: some View {
        NavigationStack {
            ZStack {
                ScrollView {
                    MarvelHeaderDetail(url: event.imageURL3, infoName: event.title, infoDescription: event.description)
                    VStack(alignment: .leading) {
                        ForEach(MarvelCD.allCases) { cell in
                            MarvelCellDetail(icon: cell.icon, labelCell: cell.labelCell, detail: detailsCell(for: cell) ?? "")
                        }
                        ForEach(event.urls, id: \.url) { marvelURL in
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
                            selectedEvents = nil
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
            return event.comics.items.map { "\($0.name)" }.formatted(.list(type: .and))
        case .series:
            return event.series.items.map { "\($0.name)" }.formatted(.list(type: .and))
        case .story:
            return event.stories.items.map { "\($0.name)" }.formatted(.list(type: .and))
        case .event:
            return nil
        case .characters:
            return event.characters.items.map { "\($0.name)" }.formatted(.list(type: .and))
        case .creators:
            return event.creators.items.map { "\($0.name) (\($0.role))" }.formatted(.list(type: .and))
        }
    }
}

#Preview {
    NavigationStack {
        EventsDetail(selected: .constant(.testEvents))
            .environment(MarvelVM.preview)
    }
}
