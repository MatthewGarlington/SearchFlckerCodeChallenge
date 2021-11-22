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
        VStack {
        AsyncImage(url: image.media.m, scale: 1.9)
            .clipShape(RoundedRectangle(cornerRadius: 15.0))
            Text(image.title)
                .bold()
                .font(.headline)
        }
        .foregroundStyle(.black)
    }
}


struct ImageSearchRowView_Previews: PreviewProvider {
    static var previews: some View {
        ImageSearchRowView(image: Items(title: "Wolf Dance", author: "Matthew Garlington", media: Media(m: URL(string: "https://live.staticflickr.com/65535/51694325392_611a7c35ee_m.jpg")!), date_taken: "Feb 2nd"))
    }
}

