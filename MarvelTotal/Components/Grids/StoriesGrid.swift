//
//  StoriesGrid.swift
//  MarvelTotal
//
//  Created by Yery Castro on 3/4/25.
//

import SwiftUI

struct StoriesGrid: View {
    @Environment(MarvelVM.self) var vm
    @Binding var selectedStory: StoriesComplete?
    @State private var items = GridItem(.flexible(minimum: 140, maximum: 180))
    var body: some View {
        Section {
            ScrollView(.horizontal) {
                LazyHGrid(rows: [items, items]) {
                    ForEach(vm.stories.stories, id: \.self) { story in
                        if story != selectedStory {
                            CardView(image: story.imageURL3, name: story.title)
                                .onAppear {
                                    if story == vm.stories.stories.last {
                                        Task {
                                            await vm.getStories()
                                        }
                                    }
                                }
                                .onTapGesture {
                                    selectedStory = story
                                }
                                
                        }
                    }
                }
            }
        } header: {
            Text("Stories")
                .font(.title2)
                .bold()
        }
    }
}

#Preview {
    StoriesGrid(selectedStory: .constant(.testStories))
        .environment(MarvelVM.preview)
}
