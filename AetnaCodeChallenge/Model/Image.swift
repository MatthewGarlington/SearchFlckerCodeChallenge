//
//  Model.swift
//  AetnaCodeChallenge
//
//  Created by us-guest on 11/20/21.
//

import Foundation
import SwiftUI

struct Image: Codable, Hashable {
    var title: String
    var items: [Items]?
    
    init(data: Data) throws {
      self = try JSONDecoder().decode(Image.self, from: data)
    }
}

struct Items: Codable, Hashable, Identifiable {
    let id = UUID()
    var title: String
    var author: String
    var media: Media
    var date_taken: String
    
}
struct Media: Codable, Hashable {
    var m: URL
}

extension Items {
    init(from items: Items) {
        let title = items.title
        let author = items.author
        let dateTaken = items.date_taken
        let media = items.media
        
        
        self.title = title
        self.author = author
        self.date_taken = dateTaken
        self.media = media
    }
}
