//
//  EventsGrid.swift
//  MarvelTotal
//
//  Created by Yery Castro on 3/4/25.
//

import SwiftUI

struct EventsGrid: View {
    @Environment(MarvelVM.self) var vm
    @Binding var selectedEvent: EventsComplete?
    @State private var items = GridItem(.flexible(minimum: 140, maximum: 180))
    var body: some View {
        Section {
            ScrollView(.horizontal) {
                LazyHGrid(rows: [items, items]) {
                    ForEach(vm.events.events, id: \.self) { event in
                        if event != selectedEvent {
                            CardView(image: event.imageURL3, name: event.title)
                                .onAppear {
                                    if event == vm.events.events.last {
                                        Task {
                                            await vm.getEvents()
                                        }
                                    }
                                }
                                .onTapGesture {
                                    selectedEvent = event
                                }
                                
                        }
                    }
                }
            }
        } header: {
            Text("Events")
                .font(.title2)
                .bold()
        }
    }
}

#Preview {
    EventsGrid(selectedEvent: .constant(.testEvents))
        .environment(MarvelVM.preview)
}
