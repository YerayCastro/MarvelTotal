//
//  CharactersGrid.swift
//  MarvelTotal
//
//  Created by Yery Castro on 3/4/25.
//

import SwiftUI

struct CharactersGrid: View {
    @Environment(MarvelVM.self) var vm
    @Binding var selectedCharacter: CharactersComplete?
    @State private var items = GridItem(.flexible(minimum: 140, maximum: 180))
    var body: some View {
        Section {
            ScrollView(.horizontal) {
                LazyHGrid(rows: [items, items]) {
                    ForEach(vm.characters.characters) { character in
                        if character != selectedCharacter {
                            CardView(image: character.imageURL, name: character.name)
                                .onAppear {
                                    if character == vm.characters.characters.last {
                                        Task {
                                            await vm.getCharacters()
                                        }
                                    }
                                }
                                .onTapGesture {
                                    selectedCharacter = character
                                }
                            
                        }
                    }
                }
            }
            
            
        } header: {
            Text("Characters")
                .font(.title2)
                .bold()
        }
        
    }
}

#Preview {
    CharactersGrid(selectedCharacter: .constant(.testCharacters))
        .environment(MarvelVM.preview)
}
