//
//  ImageSearchTaskCancellationView.swift
//  AetnaCodeChallenge
//
//  Created by us-guest on 11/21/21.
//

import SwiftUI

struct ImageSearchView: View {
    @StateObject fileprivate var viewModel = ViewModel()
    @State private var selectedItems: Items?
    @Namespace var namespace
    
    let columns = [
        GridItem(.adaptive(minimum: 120))
    ]
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            LazyVGrid(columns: columns) {
                ForEach(viewModel.image, id: \.id) { item in
                    Button { selectedItems = item} label: {
                        ImageSearchRowView(image: item)
                    }
                    .matchedGeometryEffect(id: item.id, in: namespace)
                }
            }
        }
        .overlay {
            if viewModel.isSearching {
                ProgressView()
            }
            if let item = selectedItems {
                ImageDetailView(namespace: namespace, selectedItems:
                                    $selectedItems, image: item)
            }
        }
        .animation(.spring(dampingFraction: 0.7))
        .navigationTitle("Search Flikr Image")
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
