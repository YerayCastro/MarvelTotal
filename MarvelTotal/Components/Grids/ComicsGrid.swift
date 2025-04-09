//
//  ComicsGrid.swift
//  MarvelTotal
//
//  Created by Yery Castro on 3/4/25.
//

import SwiftUI

struct ComicsGrid: View {
    @Environment(MarvelVM.self) var vm
    @Binding var selectedComic: ComicsComplete?
    @State private var items = GridItem(.flexible(minimum: 140, maximum: 180))
    var body: some View {
        Section {
            ScrollView(.horizontal) {
                LazyHGrid(rows: [items, items]) {
                    ForEach(vm.comics.comics) { comic in
                        if comic != selectedComic {
                            CardView(image: comic.imageURL3, name: comic.title)
                                .onAppear {
                                    if comic == vm.comics.comics.last {
                                        Task {
                                            await vm.getComics()
                                        }
                                    }
                                }
                                .onTapGesture {
                                    selectedComic = comic
                                }
                                
                        }
                    }
                }
            }
        } header: {
            Text("Comics")
                .font(.title2)
                .bold()
        }
    }
}

#Preview {
    ComicsGrid(selectedComic: .constant(.testComics))
        .environment(MarvelVM.preview)
}
