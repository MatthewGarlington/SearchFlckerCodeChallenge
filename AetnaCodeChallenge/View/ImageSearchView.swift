//
//  ImageSearchTaskCancellationView.swift
//  AetnaCodeChallenge
//
//  Created by us-guest on 11/21/21.
//

import SwiftUI

struct ImageSearchView: View {
    @Environment(\.dismiss) var dismiss
    
    @StateObject
    fileprivate var viewModel = ViewModel()
    
    var body: some View {
        ScrollView {
            VStack {
                ForEach(viewModel.image, id: \.self) { item in
                    NavigationLink(destination: {
                        ImageDetailView()
                    }, label: {
                        ImageSearchRowView(image: item)
                    })
                }
                
            }
        }
        .overlay {
            if viewModel.isSearching {
                ProgressView()
            }
        }
        .navigationTitle("Flickr Image Search")
        .searchable(text: $viewModel.searchTerm)
        .onReceive(viewModel.$searchTerm) { searchTerm in
            async {
                await viewModel.executeQuery()
            }
        }
    }
}

struct ImageSearchView_Previews: PreviewProvider {
    static var previews: some View {
        ImageSearchView()
    }
}
