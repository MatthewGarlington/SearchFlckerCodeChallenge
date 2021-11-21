//
//  ImageSearchRow.swift
//  AetnaCodeChallenge
//
//  Created by us-guest on 11/21/21.
//


import SwiftUI

struct ImageSearchRowView: View {
    var image: Items
    var body: some View {
        ZStack(alignment: .bottomLeading) {
            AsyncImage(url: image.media.m, scale: 0.8)
                .clipShape(RoundedRectangle(cornerRadius: 15.0))
            RoundedRectangle(cornerRadius: 15.0)
                .fill(Material.ultraThin)
                .frame(width: 300, height: 55)
            VStack(alignment: .leading) {
            Text(image.title)
                .font(.subheadline)
            Text(image.author)
                .font(.caption)
            }
            .padding()
            .foregroundStyle(.black)
            .frame(width: 300)
            .lineLimit(1)
            .minimumScaleFactor(0.5)
        }
    }
}


struct ImageSearchRowView_Previews: PreviewProvider {
    static var previews: some View {
        ImageSearchRowView(image: Items(title: "Wolf Dance", author: "Matthew Garlington", media: Media(m: URL(string: "https://live.staticflickr.com/65535/51694325392_611a7c35ee_m.jpg")!), date_taken: "Feb 2nd"))
    }
}

