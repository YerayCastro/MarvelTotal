//
//  Card.swift
//  MarvelTotal
//
//  Created by Yery Castro on 13/3/25.
//

import SwiftUI

struct CardView: View {
    let image: URL?
    let name: String
    var body: some View {
        AsyncImage(url: image) { image in
            RoundedRectangle(cornerRadius: 10)
                .frame(width: 140, height: 180, alignment: .center)
                .shadow(color: .black.opacity(0.3), radius: 5, x: 0, y: 5)
                .overlay {
                    ZStack(alignment: .bottom) {
                        image
                            .resizable()
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                        RoundedRectangle(cornerRadius: 5)
                            .frame(height: 30)
                            .foregroundStyle(.white.opacity(0.8))
                        Text(name)
                            .font(.caption)
                            .bold()
                            .multilineTextAlignment(.center)
                            .lineLimit(2)
                    }
                }
                
        } placeholder: {
            RoundedRectangle(cornerRadius: 10)
            .fill(Color.green)
                .frame(width: 140, height: 180, alignment: .center)
                .shadow(color: .black.opacity(0.3), radius: 5, x: 0, y: 5)
                .overlay {
                    VStack {
                        
                        Image(systemName: "person")
                            .resizable()
                            .scaledToFit()
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            .padding()
                        
                        ZStack {
                            RoundedRectangle(cornerRadius: 5)
                                .frame(height: 30)
                                .foregroundStyle(.white.opacity(0.8))
                            Text(name)
                                .font(.caption)
                                .bold()
                                .multilineTextAlignment(.center)
                                .lineLimit(2)
                        }
                    }
                }
        }
    }
}

#Preview {
    CardView(image: URL(string: "https://i.annihil.us/u/prod/marvel/i/mg/b/70/4c0035adc7d3a.jpg"), name: "The Rock")
}
