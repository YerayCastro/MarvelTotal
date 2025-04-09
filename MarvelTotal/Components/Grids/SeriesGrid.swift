//
//  SeriesGrid.swift
//  MarvelTotal
//
//  Created by Yery Castro on 3/4/25.
//

import SwiftUI

struct SeriesGrid: View {
    @Environment(MarvelVM.self) var vm
    @Binding var selectedSerie: SeriesComplete?
    @State private var items = GridItem(.flexible(minimum: 140, maximum: 180))
    var body: some View {
        Section {
            ScrollView(.horizontal) {
                LazyHGrid(rows: [items, items]) {
                    ForEach(vm.series.series, id: \.self) { serie in
                        if serie != selectedSerie {
                            CardView(image: serie.imageURL2, name: serie.title ?? "No Title")
                                .onAppear {
                                    if serie == vm.series.series.last {
                                        Task {
                                            await vm.getSeries()
                                        }
                                    }
                                }
                                .onTapGesture {
                                    selectedSerie = serie
                                }
                                
                        }
                    }
                }
            }
        } header: {
            Text("Series")
                .font(.title2)
                .bold()
        }
    }
}

#Preview {
    SeriesGrid(selectedSerie: .constant(.testSeries))
        .environment(MarvelVM.preview)
}
