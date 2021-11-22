//
//  ContentView.swift
//  AetnaCodeChallenge
//
//  Created by us-guest on 11/20/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack {
                ImageSearchView()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
