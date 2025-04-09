//
//  ImageDetailView.swift
//  MarvelTotal
//
//  Created by Yery Castro on 14/3/25.
//

import SwiftUI

struct ImageDetailView: View {
    let url: URL?
    
    var body: some View {
        AsyncImage(url: url) { image in
            image
                .resizable()
                .frame(width: 300, height: 350, alignment: .center)
                .border(Color.black, width: 1)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .shadow(color: .black.opacity(0.3), radius: 5, x: 0, y: 5)
                
        } placeholder: {
            Image(systemName: "gear")
                .resizable()
                .frame(width: 300, height: 350, alignment: .center)
                .border(Color.black, width: 1)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .shadow(color: .black.opacity(0.3), radius: 5, x: 0, y: 5)
        }
    }
}

#Preview {
    ImageDetailView(url: URL(string: "https://i.annihil.us/u/prod/marvel/i/mg/b/70/4c0035adc7d3a.jpg"))
}
