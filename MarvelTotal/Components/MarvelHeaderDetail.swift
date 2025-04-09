//
//  MarvelHeaderDetail.swift
//  MarvelTotal
//
//  Created by Yery Castro on 7/4/25.
//

import SwiftUI

struct MarvelHeaderDetail: View {
    let url: URL?
    let infoName: String
    let infoDescription: String
    var body: some View {
        ImageDetailView(url: url)
        Text(infoName)
            .font(.headline)
            .bold()
        Text(infoDescription)
            .font(.subheadline)
            .foregroundStyle(.secondary)
        Divider()
    }
}

#Preview {
    MarvelHeaderDetail(url: URL(string: "https://i.annihil.us/u/prod/marvel/i/mg/3/20/5232158de5b16.jpg"), infoName: "A-Bomb (HAS)", infoDescription: "Rick Jones has been Hulk's best bud since day one, but now he's more than a friend...he's a teammate! Transformed by a Gamma energy explosion, A-Bomb's thick, armored skin is just as strong and powerful as it is blue. And when he curls into action, he uses it like a giant bowling ball of destruction! ")
}
