//
//  MarvelCellDetail.swift
//  MarvelTotal
//
//  Created by Yery Castro on 4/4/25.
//

import SwiftUI

struct MarvelCellDetail: View {
    let icon: String
    let labelCell: String
    var detail: String
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Image(systemName: icon)
                    .imageScale(.medium)
                Text(labelCell)
                    .font(.subheadline)
                    .bold()
            }
            Text(detail)
                .font(.caption)
                .foregroundStyle(.secondary)
                .multilineTextAlignment(.leading)
        }
    }
}

#Preview {
    MarvelCellDetail(icon: "person", labelCell: "Comic", detail: "Spiderman in coming")
}

