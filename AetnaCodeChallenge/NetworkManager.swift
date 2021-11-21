//
//  NetworkManager.swift
//  AetnaCodeChallenge
//
//  Created by us-guest on 11/20/21.
//

import Foundation
import SwiftUI

class Network: ObservableObject {
    func getImages() async throws {
        guard let url = URL(string: "https://www.flickr.com/services/feeds/photos_public.gne?format=json&tags=wolf&nojsoncallback=1") else { fatalError("Missing URL") }
        let urlRequest = URLRequest(url: url)
        let (data, response) = try await URLSession.shared.data(for: urlRequest)
        
        guard (response as? HTTPURLResponse)?.statusCode == 200 else { fatalError("Error while fetching data") }
        let decodedImages = try JSONDecoder().decode(Response.self, from: data)
       print(decodedImages)
    }
}
