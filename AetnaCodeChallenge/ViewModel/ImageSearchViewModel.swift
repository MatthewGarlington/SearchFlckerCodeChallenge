//
//  ImageSearchViewModel.swift
//  AetnaCodeChallenge
//
//  Created by us-guest on 11/21/21.
//

import SwiftUI

@MainActor
class ViewModel: ObservableObject {
    @Published var searchTerm: String = ""
    @Published private(set) var image: [Items] = []
    @Published private(set) var isSearching = false
    
    private var searchTask: Task.Handle<Void, Never>?
    
    func executeQuery() async {
        searchTask?.cancel()
        let currentSearchTerm = searchTerm.trimmingCharacters(in: .whitespaces)
        if currentSearchTerm.isEmpty {
            image = []
            isSearching = false
        } else {
            searchTask = async {
                isSearching = true
                image = await searchImages (matching: searchTerm)
                if !Task.isCancelled {
                    isSearching = false
                }
            }
        }
    }
    
    private func searchImages(matching searchTerm: String) async -> [Items] {
        let escapedSearchTerm = searchTerm.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) ?? ""
        let url = URL(string: "https://www.flickr.com/services/feeds/photos_public.gne?format=json&tags=\(escapedSearchTerm)&nojsoncallback=1&lang=en-us")!
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let searchResult = try Image.init(data: data)
            guard let imagesItems = searchResult.items else { return [] }
            return imagesItems.compactMap { Items(from: $0) }
        }
        catch {
            return []
        }
    }
}

