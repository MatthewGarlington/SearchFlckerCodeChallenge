//
//  ImageDetailView.swift
//  AetnaCodeChallenge
//
//  Created by us-guest on 11/21/21.
//

import SwiftUI

struct ImageDetailView: View {
    var namespace: Namespace.ID
    @Binding var selectedItems: Items!
    var image: Items
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 15.0, style: .continuous)
                .fill(Material.ultraThin)
                .edgesIgnoringSafeArea(.all)
                .padding()
            ZStack(alignment: .bottom) {
                ScrollView(showsIndicators: false) {
                    VStack {
                        AsyncImage(
                            url: image.media.m,
                            content: { image in
                            image.resizable()
                                .clipShape(RoundedRectangle(cornerRadius: 15.0, style: .continuous))
                                .aspectRatio(contentMode: .fit)
                                .frame(width: UIScreen.main.bounds.width - 40 ,height: 300)
                            
                        },
                            placeholder: {
                            ProgressView()
                        }
                        )
                        
                        VStack(spacing: 40) {
                            
                            VStack(alignment: .center) {
                                Text(image.title)
                                    .bold()
                                    .font(.headline)
                                HStack {
                                    Text("Author:")
                                        .bold()
                                    Text(image.author)
                                }
                                .font(.subheadline)
                            }
                            .padding()
                            Button {
                                withAnimation(.spring(dampingFraction: 0.7)) {
                                    selectedItems = nil
                                }
                            } label: {
                                Text("Close")
                                    .bold()
                                    .foregroundColor(.white)
                                    .background(
                                        RoundedRectangle(cornerRadius: 25.0, style: .continuous)
                                            .fill(Color.blue)
                                            .frame(width: 100, height: 40)
                                    )
                            }
                        }
                    }
                }
            }
        }
    }
}
